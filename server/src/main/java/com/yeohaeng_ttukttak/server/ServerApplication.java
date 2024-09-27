package com.yeohaeng_ttukttak.server;

import com.yeohaeng_ttukttak.server.domain.auth.AccessTokenProperties;
import com.yeohaeng_ttukttak.server.domain.auth.RefreshTokenProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.apple.AppleOAuthProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleOAuthProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ResourceBundleMessageSource;

@SpringBootApplication
@EnableConfigurationProperties({AppleOAuthProperties.class, GoogleOAuthProperties.class, AccessTokenProperties.class, RefreshTokenProperties.class})
public class ServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServerApplication.class, args);
	}

	@Bean
	public MessageSource regionSource() {
		final ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasenames("regions");
		messageSource.setDefaultEncoding("utf-8");
		return messageSource;
	}

}
