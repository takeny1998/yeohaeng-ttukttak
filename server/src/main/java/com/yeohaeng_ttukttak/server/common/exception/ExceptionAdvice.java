package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.dto.ServerErrorResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.EntityTargetException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.validation.FieldError;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class ExceptionAdvice {

    private final MessageSource messageSource;

    @ExceptionHandler(ErrorException.class)
    public ServerErrorResponse handleErrorException(
            ErrorException ex, Locale locale, HttpServletRequest request) {
        logError(ex, request);
        final String message = getMessage(ex, locale);

        return new ServerErrorResponse(message, ex.getStatus().value());
    }

    @ExceptionHandler(FailException.class)
    public ServerFailResponse handleFailException(
            FailException ex, Locale locale, HttpServletRequest request) {
        logError(ex, request);
        final String message = getMessage(ex, locale);

        return new ServerFailResponse(Map.of(ex.getField(), message));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ServerFailResponse handleValidationException(
            MethodArgumentNotValidException ex, Locale locale, HttpServletRequest request) {
        logError(ex, request);

        final Map<String, String> data = ex.getFieldErrors()
                .stream()
                .collect(Collectors.toMap(FieldError::getField, fieldError -> messageSource.getMessage(fieldError, locale)));

        return new ServerFailResponse(data);
    }

    @ExceptionHandler(Exception.class)
    public ServerErrorResponse handleException(
            Exception ex, HttpServletRequest request) {
        logError(ex, request);

        Integer code = null;

        if (ex instanceof ErrorResponse) {
            code = ((ErrorResponse) ex).getStatusCode().value();
        }

        final String message = ex.getLocalizedMessage();
        return new ServerErrorResponse(message, code);
    }

    private String getMessage(BaseException ex, Locale locale) {
        final String targetName = getClassName(ex, locale);

        final Object[] args = targetName != null
                ? new Object[]{ targetName }
                : null;

        return messageSource
                .getMessage(ex.code(), args, locale);
    }

    private String getClassName(BaseException ex, Locale locale) {

        if (ex instanceof EntityTargetException entityTargetException) {
            final String targetKey = String.format(
                    "class.%s",
                    entityTargetException.target().getSimpleName()
            );

            return messageSource.getMessage(
                    targetKey,null, locale);
        }

        return null;

    }

    private void logError(Exception ex, HttpServletRequest request) {

        final String uuid = UUID.randomUUID().toString().substring(0, 7);

        log.error("[{}] -->> {} {}", uuid, request.getMethod(), request.getRequestURI());

        log.error("[{}] <<-- {}", uuid, ex.getClass().getName());
        logStackTrace(ex, uuid, 0);

        if (Objects.nonNull(ex.getCause())) {
            Throwable cause = ex.getCause();

            log.error("[{}]   <<-- Caused By: {}", uuid, cause.getClass().getName());
            log.error("[{}]   <<-- Message: {}", uuid, cause.getMessage());

            logStackTrace(cause, uuid, 2);

        }

    }

    private void logStackTrace(Throwable cause, String uuid, int depth) {
        final StackTraceElement[] stackTrace = cause.getStackTrace();

        if (stackTrace == null) return;

        String padding = " ".repeat(depth);

        log.error("[{}] {}<<-- At: {}", uuid, padding, stackTrace[0]);

        for (int i = 1; i < stackTrace.length; i ++) {
            String line = stackTrace[i].toString();

            if (line.startsWith("org.apache")
                    || line.startsWith("org.springframework")
                    || line.startsWith("jakarta")
                    || line.startsWith("java")) {
                continue;
            }
            log.error("[{}] {}<<------ {}", uuid, padding, line);
        }
    }

}
