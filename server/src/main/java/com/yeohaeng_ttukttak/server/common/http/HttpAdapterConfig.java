package com.yeohaeng_ttukttak.server.common.http;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatusCode;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpExchangeAdapter;

@Configuration
public class HttpAdapterConfig {

    @Bean
    public HttpExchangeAdapter adapter() {
        final RestClient restClient = RestClient.builder()
                .defaultStatusHandler(HttpStatusCode::isError, new RestClientErrorHandler())
                .build();

        return RestClientAdapter.create(restClient);
    }

}
