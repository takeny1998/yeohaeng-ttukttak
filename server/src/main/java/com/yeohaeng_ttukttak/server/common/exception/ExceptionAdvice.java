package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.dto.ServerErrorResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.InternalServerErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;
import com.yeohaeng_ttukttak.server.common.locale.LocalizedMessageService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.*;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class ExceptionAdvice {

    private final LocalizedMessageService localizedMessageService;

    private final MessageSource messageSource;

    @ExceptionHandler(FailException.class)
    public ServerFailResponse handleFailException(
            FailException exception, Locale locale, HttpServletRequest request) {

        logError(exception, request, 0);

        return new ServerFailResponse(List.of(exception.toErrorObject(locale)));

    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ServerFailResponse handleValidationException(
            MethodArgumentNotValidException exception, Locale locale, HttpServletRequest request) {
        logError(exception, request, 0);

        final List<Map<String, String>> data = exception
                .getFieldErrors()
                .stream()
                .map(fieldError -> Map.of(
                        "code", "METHOD_ARGUMENT_NOT_VALID_FAIL",
                        "field", fieldError.getField(),
                        "message", messageSource.getMessage(fieldError, locale)))
                .toList();

        return new ServerFailResponse(data);
    }

    @ExceptionHandler(ErrorException.class)
    public ServerErrorResponse handleErrorException(
            ErrorException exception, Locale locale, HttpServletRequest request) {

        logError(exception, request, 0);
        final String message = localizedMessageService.fromException(locale, exception);

        return new ServerErrorResponse(exception.code(), message);
    }

    @ExceptionHandler(Exception.class)
    public ServerErrorResponse handleException(
            Exception exception, Locale locale, HttpServletRequest request) {

        final InternalServerErrorException errorException =
                new InternalServerErrorException(exception);

        logError(errorException, request, 0);

        final String message = localizedMessageService.fromException(locale, errorException);

        return new ServerErrorResponse(errorException.code(), message);
    }

    private void logError(Throwable exception, HttpServletRequest request, int depth) {

        final String uuid = UUID.randomUUID().toString().substring(0, 7);

        String padding = " ".repeat(depth);

        if (depth == 0) {
            log.error("[{}] -->> {} {}", uuid, request.getMethod(), request.getRequestURI());

        }

        log.error("[{}] {}<<-- Caused By: {}", uuid, padding, exception.getClass().getName());
        log.error("[{}] {}<<-- Message: {}", uuid, padding, exception.getMessage());

        logStackTrace(exception, uuid, depth);

        if (Objects.nonNull(exception.getCause())) {
            logError(exception.getCause(), request, depth + 2);
        }

    }

    private void logStackTrace(Throwable cause, String uuid, int depth) {
        final StackTraceElement[] stackTrace = cause.getStackTrace();

        if (stackTrace == null) return;

        final String padding = " ".repeat(depth);

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
