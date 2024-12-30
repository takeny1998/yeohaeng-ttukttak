package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.dto.ServerErrorResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.InternalServerErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;
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

    private final MessageSource messageSource;

    @ExceptionHandler(FailException.class)
    public ServerFailResponse handleFailException(
            FailException exception, Locale locale, HttpServletRequest request) {

        logError(exception, request);

        final Map<String, String> error = new HashMap<>(
                Map.of("code", exception.code(),
                        "message", getMessage(exception, locale)));

        if (Objects.nonNull(exception.field())) {
            error.put("field", exception.field());
        }

        return new ServerFailResponse(List.of(error));

    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ServerFailResponse handleValidationException(
            MethodArgumentNotValidException exception, Locale locale, HttpServletRequest request) {
        logError(exception, request);

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

        logError(exception, request);
        final String message = getMessage(exception, locale);

        return new ServerErrorResponse(exception.code(), message);
    }

    @ExceptionHandler(Exception.class)
    public ServerErrorResponse handleException(
            Exception exception, Locale locale, HttpServletRequest request) {

        final InternalServerErrorException errorException =
                new InternalServerErrorException(exception);

        exception.printStackTrace();

        logError(errorException, request);

        final String message = getMessage(errorException, locale);

        return new ServerErrorResponse(errorException.code(), message);
    }

    private String getMessage(BaseException ex, Locale locale) {
        final Object[] arguments = ex instanceof ArgumentException
                ? ((ArgumentException) ex).args()
                : null;

        return messageSource.getMessage(ex.code(), arguments, locale);
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
