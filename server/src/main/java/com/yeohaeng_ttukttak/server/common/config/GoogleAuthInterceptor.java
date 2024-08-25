package com.yeohaeng_ttukttak.server.common.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.exchange_token.ExchangeTokenResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.io.IOException;
import java.util.Objects;

import static org.springframework.web.context.request.RequestAttributes.SCOPE_REQUEST;

@Slf4j
public class GoogleAuthInterceptor implements ClientHttpRequestInterceptor {


    @Override
    public ClientHttpResponse intercept(HttpRequest request,
                                        byte[] body,
                                        ClientHttpRequestExecution execution) throws IOException {

        // 현재 Servlet 요청의 속성 목록을 불러온다.
        // null-safe를 위해 early return 한다.
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        if (Objects.isNull(attributes)) {
            return execution.execute(request, body);
        }

        String shortUUID = request.getHeaders()
                .getFirst("Request-Trace-UUID");

        // 현재 Servlet에 저장된 액세스 토큰이 있는지 확인한다.
        Object accessToken = attributes.getAttribute("googleAuth", SCOPE_REQUEST);

        // 존재할 경우, 액세스 토큰을 헤더에 추가한다.
        if (Objects.nonNull(accessToken)) {
            log.debug("[{}] >> -- Using cached Access Token", shortUUID);
            request.getHeaders()
                    .add("Authorization", "Bearer " + accessToken);
        }

        ClientHttpResponse response =
                new ReusableClientHttpResponseWrapper(execution.execute(request, body));

        // 아래 레퍼런스에 의거해 401 요청이면 토큰이 만료된 것으로 간주
        // https://cloud.google.com/apigee/docs/api-platform/reference/policies/oauth-http-status-code-reference?hl=ko#verifyaccesstoken-accesstokenexpired
        if (response.getStatusCode().isSameCodeAs(HttpStatusCode.valueOf(401))) {
            // 만료된 경우 저장된 인증 정보를 삭제한다.
            attributes.removeAttribute("googleAuth", SCOPE_REQUEST);
            return response;
        }

        // 요청이 POST /token 이 아닌 경우 조기 리턴한다.
        boolean isPathMatched = Objects.equals(request.getURI().getPath(), "/token");
        boolean isMethodMatched = request.getMethod().matches("POST");
        if (!isPathMatched || !isMethodMatched) return response;

        // 토큰 정보를 추출해 서블릿 속성에 저장한다.
        ExchangeTokenResponse tokenResponse = new ObjectMapper()
                .readValue(response.getBody(), ExchangeTokenResponse.class);
        attributes.setAttribute("googleAuth", tokenResponse.accessToken(), SCOPE_REQUEST);

        return response;
    }

}
