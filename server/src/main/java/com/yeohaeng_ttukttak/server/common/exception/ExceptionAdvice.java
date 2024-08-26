package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.exception.dto.ErrorResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.ApiException;
import com.yeohaeng_ttukttak.server.common.exception.exception.BusinessException;
import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.RequiredFieldMissingException;
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

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleEntityNotFoundException(
            EntityNotFoundException ex, Locale locale) {

        String code = ex.getCode();
        String message = messageSource.getMessage(code, null, locale);

        return ResponseEntity.status(ex.getStatus())
                .body(new ErrorResponse(code, message, ex.getTarget()));

    }

    @ExceptionHandler(RequiredFieldMissingException.class)
    public ResponseEntity<ErrorResponse> handleRequiredFieldMissingException(
            RequiredFieldMissingException ex, Locale locale) {

        String code = ex.getCode();
        String message = messageSource.getMessage(code, null, locale);

        return ResponseEntity.status(ex.getStatus())
                .body(new ErrorResponse(code, message, ex.getTarget()));

    }

    @ExceptionHandler(ApiException.class)
    public ResponseEntity<ErrorResponse> handleApiException(
            ApiException ex, Locale locale) {

        String code = ex.getCode();
        String message = messageSource.getMessage(code, null, locale);

        return ResponseEntity.status(ex.getStatus())
                .body(new ErrorResponse(code, message));

    }

}
