package com.yeohaeng_ttukttak.server.common.docs;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.parameters.Parameter;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;

import java.util.List;
import java.util.Objects;

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
    public OperationCustomizer customOperationCustomizer() {
        return new OperationCustomizer() {
            @Override
            public Operation customize(Operation operation, HandlerMethod handlerMethod) {

                handleAuthorization(operation, handlerMethod);

                return operation;
            }
        };
    }


    /**
     * 사용자 인증 관련 API 문서 정보를 처리합니다.
     * <ul>
     *     <li>사용자 정보(AuthenticationContext) 파라미터를 API 문서에서 제거합니다.</li>
     *     <li>인증이 필요한 메서드를 API 문서에 표시합니다.</li>
     * </ul>
     */
    private void handleAuthorization(Operation operation, HandlerMethod handlerMethod) {

        if (Objects.nonNull(operation.getParameters())) {

            final List<Parameter> parameters = operation.getParameters().stream()
                    .filter(parameter -> parameter.getClass().isInstance(AuthenticationContext.class))
                    .toList();

            operation.setParameters(parameters);
        }

        final Authorization authorizationAnnotation
                = handlerMethod.getMethodAnnotation(Authorization.class);

        if (Objects.isNull(authorizationAnnotation)) {
            return;
        }

        operation.setSecurity(List.of(securityRequirement()));
    }

    private SecurityRequirement securityRequirement() {
        return new SecurityRequirement()
                .addList(SECURITY_NAME); // 보안 요구 사항을 추가합니다.
    }

}