package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.common.exception.exception.ExternalApiErrorException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import static org.springframework.web.client.RestClient.ResponseSpec.ErrorHandler;

@Slf4j
public class RestClientErrorHandler implements  ErrorHandler {

    @Override
    public void handle(HttpRequest request, ClientHttpResponse response) throws IOException {

        String shortUUID = request.getHeaders()
                .getFirst("Request-Trace-UUID");

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

        throw new ExternalApiErrorException();
    }

}
