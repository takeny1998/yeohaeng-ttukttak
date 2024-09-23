package com.yeohaeng_ttukttak.server.domain.oauth;

import com.yeohaeng_ttukttak.server.common.util.HttpClientUtil;
import com.yeohaeng_ttukttak.server.domain.oauth.apple.AppleOAuthClient;
import com.yeohaeng_ttukttak.server.domain.oauth.apple.AppleOAuthProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleOAuthClient;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleOAuthProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleProfileClient;
import com.yeohaeng_ttukttak.server.domain.oauth.service.AppleOAuthService;
import com.yeohaeng_ttukttak.server.domain.oauth.service.GoogleOAuthService;
import com.yeohaeng_ttukttak.server.domain.oauth.service.OAuthService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.support.RestClientAdapter;
import org.springframework.web.service.invoker.HttpExchangeAdapter;

@Configuration
public class OAuthConfig {

    @Bean
    AppleOAuthClient appleOAuthClient(HttpExchangeAdapter adapter) {
        return HttpClientUtil.createClient(adapter, AppleOAuthClient.class);
    }

    @Bean
    OAuthService appleOAuthService(
            AppleOAuthClient appleOAuthClient, AppleOAuthProperties appleOAuthProperties) {
        return new AppleOAuthService(appleOAuthClient, appleOAuthProperties);
    }

    @Bean
    GoogleOAuthClient googleOAuthClient(HttpExchangeAdapter adapter) {
        return HttpClientUtil.createClient(adapter, GoogleOAuthClient.class);
    }

    @Bean
    GoogleProfileClient googleProfileClient(HttpExchangeAdapter adapter) {
        return HttpClientUtil.createClient(adapter, GoogleProfileClient.class);
    }

    @Bean
    OAuthService googleOAuthService(
            GoogleOAuthClient googleOAuthClient, GoogleProfileClient googleProfileClient, GoogleOAuthProperties googleOAuthProperties
    ) {
        return new GoogleOAuthService(googleOAuthClient, googleProfileClient, googleOAuthProperties);
    }


}
