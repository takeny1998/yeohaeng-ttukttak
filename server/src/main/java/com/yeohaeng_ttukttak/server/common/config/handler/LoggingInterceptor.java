package com.yeohaeng_ttukttak.server.common.config.handler;

import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;

import java.io.IOException;

@Slf4j
public class LoggingInterceptor implements ClientHttpRequestInterceptor {

    @Override
    public ClientHttpResponse intercept(
            HttpRequest request, byte[] body, ClientHttpRequestExecution execution) throws IOException {

        String shortUUID = StringUtil.generateShortUUID();
        log.debug("[{}] >> {} {}", shortUUID, request.getMethod(), request.getURI());

        request.getHeaders()
                .add("Request-Trace-UUID", shortUUID);

        ClientHttpResponse response = execution.execute(request, body);

        log.debug("[{}] << {}", shortUUID, response.getStatusCode());

        return response;

    }
}
