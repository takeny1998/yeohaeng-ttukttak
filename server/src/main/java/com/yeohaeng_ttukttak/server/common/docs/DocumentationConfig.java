package com.yeohaeng_ttukttak.server.common.docs;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@OpenAPIDefinition(info = @Info(
        title = "여행 뚝딱 API Docs",
        description = "여행 뚝딱 서비스를 위한 HTTP API 입니다.",
        version = "V2"
))
@Configuration
public class DocumentationConfig {

    private static final String SECURITY_NAME = "Authorization";
    private static final String SECURITY_SCHEME = "bearer";
    private static final String SECURITY_FORMAT = "JWT";

    @Bean
    public OpenAPI openAPI() {

        final SecurityScheme securityScheme = new SecurityScheme()
                .type(SecurityScheme.Type.HTTP)
                .scheme(SECURITY_SCHEME)
                .bearerFormat(SECURITY_FORMAT)
                .in(SecurityScheme.In.HEADER)
                .name(SECURITY_NAME);


        final Components authorization = new Components()
                .addSecuritySchemes(SECURITY_NAME, securityScheme);

        return new OpenAPI()
                .components(authorization);
    }

    @Bean
    public OperationCustomizer authorizationChecker() {
        return new OperationCustomizer() {
            @Override
            public Operation customize(Operation operation, HandlerMethod handlerMethod) {

                final Authorization authorizationAnnotation
                        = handlerMethod.getMethodAnnotation(Authorization.class);

                if (Objects.isNull(authorizationAnnotation)) {
                    operation.setSecurity(Collections.emptyList());
                } else {
                    operation.setSecurity(List.of(securityRequirement()));
                }

                return operation;
            }
        };
    }

    private SecurityRequirement securityRequirement() {
        return new SecurityRequirement()
                .addList(SECURITY_NAME); // 보안 요구 사항을 추가합니다.
    }

}