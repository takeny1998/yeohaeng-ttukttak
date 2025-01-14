package com.yeohaeng_ttukttak.server.common.docs;

import com.github.therapi.runtimejavadoc.Link;
import com.github.therapi.runtimejavadoc.MethodJavadoc;
import com.github.therapi.runtimejavadoc.RuntimeJavadoc;
import com.github.therapi.runtimejavadoc.SeeAlsoJavadoc;
import com.yeohaeng_ttukttak.server.application.travel.controller.TravelController;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerErrorResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import com.yeohaeng_ttukttak.server.common.locale.LocalizedMessageService;
import com.yeohaeng_ttukttak.server.common.locale.RequestLocaleService;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.examples.Example;
import io.swagger.v3.oas.models.media.Content;
import io.swagger.v3.oas.models.media.MediaType;
import io.swagger.v3.oas.models.media.ObjectSchema;
import io.swagger.v3.oas.models.parameters.Parameter;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.responses.ApiResponses;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springdoc.core.customizers.OperationCustomizer;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.HandlerMethod;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

    private final LocalizedMessageService localizedMessageService;

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
        final Locale currentLocale = requestLocaleService.getCurrentLocale();

        return new OperationCustomizer() {
            @Override
            public Operation customize(Operation operation, HandlerMethod handlerMethod) {

                handleResponse(operation, handlerMethod, currentLocale);

                handleAuthorization(operation, handlerMethod);

                return operation;
            }
        };
    }

    @SneakyThrows
    public void handleResponse(final Operation operation, final HandlerMethod handlerMethod, final Locale locale) {

        final ApiResponses responses = operation.getResponses();
        final ApiResponse apiResponse = new ApiResponse();


        final ApiExceptionResponse apiExceptionResponse =
                handlerMethod.getMethodAnnotation(ApiExceptionResponse.class);

        if (Objects.isNull(apiExceptionResponse)) return;

        final Class<?>[] exceptionClasses = apiExceptionResponse.value();

        final MediaType mediaType = new MediaType();

        for (Class<?> exceptionClass : exceptionClasses) {

            final Example example = resolveExample(exceptionClass, locale);

            mediaType.addExamples(exceptionClass.getSimpleName(), example);

        }

        operation.setResponses(responses.addApiResponse("200",
                apiResponse.content(new Content().addMediaType(
                        "application/json", mediaType)
                )));
    }

    @SneakyThrows
    private Example resolveExample(Class<?> clazz, Locale locale) {

        if (FailException.class.isAssignableFrom(clazz)) {

            final FailException failException = FailException.class.cast(
                    clazz.getConstructor().newInstance());

            final ServerFailResponse failResponse = new ServerFailResponse(failException.toErrorObject(locale));

            return new Example().value(failResponse);

        } else if (ErrorException.class.isAssignableFrom(clazz)) {

            final ErrorException errorException = ErrorException.class.cast(
                    clazz.getConstructor().newInstance());

            final ServerErrorResponse errorResponse = new ServerErrorResponse(
                    errorException.code(), localizedMessageService.fromException(locale, errorException));

            return new Example().value(errorResponse);
        }

        return null;
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

        final Authentication authenticationAnnotation
                = handlerMethod.getMethodAnnotation(Authentication.class);

        if (Objects.isNull(authenticationAnnotation)) {
            return;
        }

        operation.setSecurity(List.of(securityRequirement()));
    }

    private SecurityRequirement securityRequirement() {
        return new SecurityRequirement()
                .addList(SECURITY_NAME); // 보안 요구 사항을 추가합니다.
    }

}