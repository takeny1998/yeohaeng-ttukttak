package com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client;

import com.yeohaeng_ttukttak.server.common.util.HttpClientUtil;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.GoogleAuthInterceptor;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.GoogleProfileClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpExchangeAdapter;

@Configuration
public class GoogleClientConfig {

    @Bean
    public HttpExchangeAdapter googleAdapter(RestClient client) {
        RestClient googleClient = client.mutate()
                .requestInterceptor(new GoogleAuthInterceptor())
                .build();

        return RestClientAdapter.create(googleClient);
    }

    @Bean
    public GoogleOAuthClient googleOAuthClient(HttpExchangeAdapter googleAdapter) {

        return HttpClientUtil.createClient(googleAdapter, GoogleOAuthClient.class);

    }

    @Bean
    public GoogleProfileClient googleProfileClient(HttpExchangeAdapter googleAdapter) {

        return HttpClientUtil.createClient(googleAdapter, GoogleProfileClient.class);

    }


}
