package com.yeohaeng_ttukttak.server.doc;

import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionMessageService;
import com.yeohaeng_ttukttak.server.common.exception.dto.ExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.locale.RequestLocaleService;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.examples.Example;
import io.swagger.v3.oas.models.media.Content;
import io.swagger.v3.oas.models.media.MediaType;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import jakarta.annotation.Nullable;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;

import java.util.List;
import java.util.Locale;
import java.util.Objects;

@OpenAPIDefinition(info = @Info(
        title = "여행 뚝딱 API Docs",
        description = "여행 뚝딱 서비스를 위한 HTTP API 입니다.",
        version = "V2"
))
@Slf4j
@Configuration
@RequiredArgsConstructor
public class DocumentationConfig {

    private final RequestLocaleService requestLocaleService;

    private final ExceptionMessageService messageService;

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

        final Components components = new Components()
                .addSecuritySchemes(SECURITY_NAME, securityScheme);


        return new OpenAPI()
                .components(components);
    }

    @Bean
    public OperationCustomizer customOperationCustomizer() {
        final Locale currentLocale = requestLocaleService.getCurrentLocale();

        return new OperationCustomizer() {
            @Override
            public Operation customize(Operation operation, HandlerMethod handlerMethod) {

//                handleSuccessResponse(operation, handlerMethod);
//                handleExceptionResponse(operation, handlerMethod, currentLocale);

                return operation;
            }
        };
    }

    @Bean
    public OperationCustomizer handleSuccessResponse() {
        return (operation, handlerMethod) -> {

            final MediaType mediaType = get200MediaType(operation);
            if (mediaType == null) return operation;

            mediaType.addExamples("SUCCESS", new Example());
            return operation;

        };
    }

    @Bean
    public OperationCustomizer handleAuthentication() {
        return (operation, handlerMethod) -> {

            final Authentication annotation
                    = handlerMethod.getMethodAnnotation(Authentication.class);

            if (Objects.isNull(annotation)) return operation;

            operation.setSecurity(List.of(securityRequirement()));

            final MediaType mediaType = get200MediaType(operation);
            if (mediaType == null) return operation;

            addExceptionAsExample(mediaType, ExceptionCode.AUTHENTICATION_FAIL);

            return operation;
        };
    }

    @Bean
    public OperationCustomizer handleGlobalException() {
        return (operation, handlerMethod) -> {

            final MediaType mediaType = get200MediaType(operation);

            if (mediaType == null) return operation;

            for (ExceptionCode globalException : ExceptionCode.getGlobalExceptions()) {
                addExceptionAsExample(mediaType, globalException);
            }

            return operation;
        };
    }

    @Bean
    public OperationCustomizer handleDomainException() {
        return (operation, handlerMethod) -> {

            final MediaType mediaType = get200MediaType(operation);

            if (mediaType == null) return operation;

            final Throws annotation =
                    handlerMethod.getMethodAnnotation(Throws.class);

            if (annotation == null) return operation;

            for (ExceptionCode exceptionCode : annotation.value()) {
                addExceptionAsExample(mediaType, exceptionCode);
            }

            return operation;
        };
    }

    @Nullable
    private MediaType get200MediaType(Operation operation) {

        final ApiResponse response = operation.getResponses().get("200");
        if (response == null) return null;

        final Content content = response.getContent();
        if (content == null) return null;

        return content.get("application/json");

    }

    private void addExceptionAsExample(final MediaType mediaType, final ExceptionCode exceptionCode) {
        final ExceptionWrapper exceptionWrapper = exceptionCode.wrap();

        mediaType.addExamples(exceptionCode.name(),
                new Example().value(ServerResponse.of(exceptionWrapper, messageService.getMessage(exceptionWrapper))));
    }

    private SecurityRequirement securityRequirement() {
        return new SecurityRequirement().addList(SECURITY_NAME);
    }

}