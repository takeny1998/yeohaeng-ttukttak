package com.yeohaeng_ttukttak.server.common.config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.user.service.client.dto.ExchangeTokenResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@Configuration
public class HttpInterfaceConfig {

    @Bean
    public RestClient restClient(HttpServletRequest servletRequest) {

        return RestClient.builder()
                .defaultStatusHandler(HttpStatusCode::isError, (request, response) -> {

                    String shortUUID = StringUtil.generateShortUUID();

                    try (BufferedReader bodyReader = new BufferedReader(
                            new InputStreamReader(response.getBody()))) {

                        log.error("[{}] >> {} {}", shortUUID, request.getMethod(), request.getURI());

                        request.getHeaders()
                                .forEach((key, values) -> {
                                    log.error("[{}] >> -- {}: {}", shortUUID, key, values);
                                });

                        log.error("[{}] << {}", shortUUID, response.getStatusCode());

                        String line;
                        while ((line = bodyReader.readLine()) != null) {
                            log.error("[{}] <<-- {}", shortUUID, line);
                        }

                    } catch(IOException e) {
                        log.error("[{}] [!] {}", shortUUID, e.getMessage());
                    }

                })

                .requestInterceptor(((request, body, execution) -> {

                    Optional.ofNullable(servletRequest.getAttribute("googleAccessToken"))
                            .ifPresent(accessToken -> {

                                request.getHeaders()
                                        .add("Authorization", "Bearer " + accessToken);

                            });

                    ClientHttpResponse response =
                            new ReusableClientHttpResponseWrapper(execution.execute(request, body));

                    String path = request.getURI().getPath();

                    if (!Objects.equals(path, "/token") || !request.getMethod().matches("POST")) {
                        return response;
                    }

                    if (response.getStatusCode().isError()) return response;

                    ExchangeTokenResponse tokenResponse = new ObjectMapper()
                            .readValue(response.getBody(), ExchangeTokenResponse.class);

                    log.info(tokenResponse.accessToken());

                    servletRequest.setAttribute("googleAccessToken", tokenResponse.accessToken());

                    return response;

                })).build();

    }

    @Bean
    public GoogleOAuthClient googleOAuthService(RestClient googleClient) {

        return HttpServiceProxyFactory
                .builderFor(RestClientAdapter.create(googleClient))
                .build()
                .createClient(GoogleOAuthClient.class);

    }

    @Bean
    public GoogleProfileClient googleProfileClient(RestClient googleClient) {

        return HttpServiceProxyFactory
                .builderFor(RestClientAdapter.create(googleClient))
                .build()
                .createClient(GoogleProfileClient.class);

    }

}
