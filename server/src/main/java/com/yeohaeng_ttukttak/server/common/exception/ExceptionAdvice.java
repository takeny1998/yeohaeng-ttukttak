package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.dto.ServerErrorResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerFailResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.dto.ErrorExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.exception.dto.FailExceptionDto;
import com.yeohaeng_ttukttak.server.common.exception.dto.FailExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
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

    private final ExceptionMessageService messageService;

    @ExceptionHandler(FailExceptionWrapper.class)
    public ServerResponse handleFailException(
            FailExceptionWrapper exceptionWrapper, HttpServletRequest request) {

        logError(exceptionWrapper, request, 0);

        final String message = messageService.getMessage(exceptionWrapper);

        return ServerResponse.of(exceptionWrapper, message);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ServerFailResponse handleValidationException(
            MethodArgumentNotValidException exception, Locale locale, HttpServletRequest request) {
        logError(exception, request, 0);

        final List<FailExceptionDto> data = exception
                .getFieldErrors()
                .stream()
                .map(fieldError -> new FailExceptionDto(
                        "INVALID_ARGUMENT_FAIL", fieldError.getField(),
                        messageSource.getMessage(fieldError, locale)))
                .toList();

        return new ServerFailResponse(data);
    }

    @ExceptionHandler(ErrorExceptionWrapper.class)
    public ServerResponse handleErrorException(
            ErrorExceptionWrapper exceptionWrapper, HttpServletRequest request) {

        logError(exceptionWrapper, request, 0);

        final String message = messageService.getMessage(exceptionWrapper);

        return ServerResponse.of(exceptionWrapper, message);
    }


    private void logError(Throwable throwable, HttpServletRequest request, int depth) {

        final String uuid = UUID.randomUUID().toString().substring(0, 7);

        final String message = throwable instanceof BaseException
                ? messageService.getMessage((BaseException) throwable, Locale.getDefault())
                : throwable.getMessage();

        final String padding = " ".repeat(depth);

        if (depth == 0) {
            log.error("[{}] -->> {} {}", uuid, request.getMethod(), request.getRequestURI());
        }

        log.error("[{}] {}<<-- Caused By: {}", uuid, padding, throwable.getClass().getName());

        log.error("[{}] {}<<-- Message: {}", uuid, padding, message);

        logStackTrace(throwable, uuid, depth);

        if (Objects.nonNull(throwable.getCause())) {
            logError(throwable.getCause(), request, depth + 2);
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
