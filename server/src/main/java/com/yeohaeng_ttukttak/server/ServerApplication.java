package com.yeohaeng_ttukttak.server;

import com.yeohaeng_ttukttak.server.user.service.client.property.AppleOAuthProps;
import com.yeohaeng_ttukttak.server.user.service.client.property.GoogleOAuthProps;
import com.yeohaeng_ttukttak.server.user.service.token.property.JwtProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@EnableJpaAuditing
@EnableJpaRepositories
@EnableConfigurationProperties({GoogleOAuthProps.class, AppleOAuthProps.class, JwtProperties.class})
@SpringBootApplication
public class ServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServerApplication.class, args);
	}

}
