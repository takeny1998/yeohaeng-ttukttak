package com.yeohaeng_ttukttak.server.oauth2.service.provider.apple.client;

import com.yeohaeng_ttukttak.server.common.util.HttpClientUtil;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.GoogleAuthInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpExchangeAdapter;

@Configuration
public class AppleClientConfig {

    @Bean
    public HttpExchangeAdapter appleAdapter(RestClient client) {
        RestClient googleClient = client.mutate()
                .requestInterceptor(new GoogleAuthInterceptor())
                .build();

        return RestClientAdapter.create(googleClient);
    }

    @Bean
    public AppleOAuthClient appleOAuthClient(HttpExchangeAdapter appleAdapter) {
        return HttpClientUtil.createClient(
                appleAdapter, AppleOAuthClient.class);
    }

}

