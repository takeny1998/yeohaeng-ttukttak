package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.user.service.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.user.service.client.GoogleProfileClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatusCode;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;

@Slf4j
@Configuration
public class HttpInterfaceConfig {

    @Bean
    public RestClient.Builder clientBuilder() {

        return RestClient.builder()
                .requestInterceptor(new LoggingInterceptor())
                .defaultStatusHandler(HttpStatusCode::isError, new RestClientErrorHandler());

    }

    @Bean
    public HttpServiceProxyFactory googleClientFactory(RestClient.Builder clientBuilder) {

        RestClient client = clientBuilder
                .requestInterceptor(new GoogleAuthInterceptor())
                .build();

        return HttpServiceProxyFactory
                .builderFor(RestClientAdapter.create(client))
                .build();

    }

    @Bean
    public GoogleOAuthClient googleOAuthService(
            HttpServiceProxyFactory googleClientFactory) {

        return googleClientFactory.createClient(GoogleOAuthClient.class);
    }

    @Bean
    public GoogleProfileClient googleProfileClient(
            HttpServiceProxyFactory googleClientFactory)  {

        return googleClientFactory.createClient(GoogleProfileClient.class);
    }

}
