package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.common.util.MyStringUtil;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleProfileClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatusCode;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@Slf4j
@Configuration
public class HttpInterfaceConfig {

    @Bean
    public HttpServiceProxyFactory httpServiceProxyFactory() {

        RestClient client = RestClient
                .builder()
                .defaultStatusHandler(HttpStatusCode::isError, (request, response) -> {

                    String shortUUID = MyStringUtil.generateShortUUID();

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
                .build();

        return HttpServiceProxyFactory
                .builderFor(RestClientAdapter.create(client))
                .build();

    }

    @Bean
    public GoogleOAuthClient googleOAuthService(
            HttpServiceProxyFactory httpServiceProxyFactory) {

        return httpServiceProxyFactory
                .createClient(GoogleOAuthClient.class);

    }

    @Bean
    public GoogleProfileClient googleProfileClient(
            HttpServiceProxyFactory httpServiceProxyFactory) {

        return httpServiceProxyFactory.createClient(GoogleProfileClient.class);

    }


}
