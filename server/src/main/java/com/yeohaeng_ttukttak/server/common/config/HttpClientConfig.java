package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.common.config.handler.LoggingInterceptor;
import com.yeohaeng_ttukttak.server.common.config.handler.RestClientErrorHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatusCode;
import org.springframework.web.client.RestClient;

@Slf4j
@Configuration
public class HttpClientConfig {

    @Bean
    public RestClient client() {
        return RestClient.builder()
                .requestInterceptor(new LoggingInterceptor())
                .defaultStatusHandler(HttpStatusCode::isError, new RestClientErrorHandler())
                .build();
    }

}
