package com.yeohaeng_ttukttak.server;

import com.yeohaeng_ttukttak.server.domain.auth.AccessTokenProperties;
import com.yeohaeng_ttukttak.server.domain.auth.RefreshTokenProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.apple.AppleOAuthProperties;
import com.yeohaeng_ttukttak.server.domain.oauth.google.GoogleOAuthProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing(modifyOnCreate = false)
@EnableConfigurationProperties({AppleOAuthProperties.class, GoogleOAuthProperties.class, AccessTokenProperties.class, RefreshTokenProperties.class})
@SpringBootApplication
public class ServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServerApplication.class, args);
	}

}

