package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.exception.dto.ErrorResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.*;
import com.yeohaeng_ttukttak.server.common.exception.exception.internal_server_error.InternalServerErrorException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.TargetException;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Locale;
import java.util.Objects;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class ExceptionAdvice {

    private final MessageSource messageSource;

    @ExceptionHandler(ApiException.class)
    public ResponseEntity<ErrorResponse> handleApiException(
            ApiException ex, Locale locale, HttpServletRequest request) {

        logError(ex, request);

        final String code = ex.getCode();
        final String message =
                messageSource.getMessage(code, null, locale);

        String target = null;

        if (ex instanceof TargetException) {
            target = ((TargetException) ex).getTarget();
        }

        return ResponseEntity.status(ex.getStatus())
                .body(new ErrorResponse(code, message, target));

    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleException(
            Exception ex, Locale locale, HttpServletRequest request) {

        InternalServerErrorException exception = new InternalServerErrorException();

        logError(ex, request);
        final String message =
                messageSource.getMessage(exception.getCode(), null, locale);

        return ResponseEntity.status(exception.getStatus())
                .body(new ErrorResponse(exception.getCode(), message));
    }

    private void logError(Exception ex, HttpServletRequest request) {

        String uuid = StringUtil.generateShortUUID();

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
