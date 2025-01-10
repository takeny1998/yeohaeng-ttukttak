package com.yeohaeng_ttukttak.server.common.authorization;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AuthorizationConfig {

    @Bean
    public RoleBasedPermissionManager permissionManagerFactory() {
        return new RoleBasedPermissionManager();
    }

}
