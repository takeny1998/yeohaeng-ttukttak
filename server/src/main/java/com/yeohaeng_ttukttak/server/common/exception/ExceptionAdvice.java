package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.dto.ServerErrorResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.TargetException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Locale;
import java.util.Objects;
import java.util.UUID;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class ExceptionAdvice {

    private final MessageSource messageSource;

    @ExceptionHandler(ErrorException.class)
    public ServerErrorResponse handleErrorException(
            ErrorException ex, Locale locale, HttpServletRequest request) {
        logError(ex, request);

        final String targetName = getClassName(ex, locale);

        final Object[] args = targetName != null
                ? new Object[]{ targetName }
                : null;

        final String message = messageSource
                .getMessage(ex.code(), args, locale);

        return new ServerErrorResponse(message, ex.getStatus().value());
    }

    @ExceptionHandler(FailException.class)
    public ServerFailResponse handleTargetNotFoundException(
            FailException ex, Locale locale, HttpServletRequest request) {
        logError(ex, request);

        final String message = messageSource
                .getMessage(ex.getCode(), null, locale);

        return new ServerFailResponse(message);
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

    private String getClassName(BaseException ex, Locale locale) {

        if (ex instanceof TargetException targetException) {
            final String targetKey = String.format(
                    "class.%s",
                    targetException.target().getSimpleName()
            );

            return messageSource.getMessage(
                    targetKey,null, locale);
        }

        return null;

    }

    private void logError(Exception ex, HttpServletRequest request) {

        final String uuid = UUID.randomUUID().toString();

        log.error("[{}] >> {} {}",
                uuid, request.getMethod(), request.getRequestURI());

        log.error("[{}] << {}", uuid, ex.getClass().getName());

        if (Objects.nonNull(ex.getStackTrace())) {
            log.error("[{}] <<-- At: {}", uuid, ex.getStackTrace()[0]);
        }

        if (Objects.nonNull(ex.getCause())) {
            Throwable cause = ex.getCause();

            log.error("[{}] <<-- Caused By: {}", uuid, cause.getClass().getName());
            log.error("[{}] <<---- Message: {}", uuid, cause.getMessage());
        }

    }

}
