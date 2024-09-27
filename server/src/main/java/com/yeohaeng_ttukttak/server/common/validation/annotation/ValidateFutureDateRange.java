package com.yeohaeng_ttukttak.server.common.validation.annotation;

import com.yeohaeng_ttukttak.server.common.validation.FutureDateRangeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = FutureDateRangeValidator.class)
public @interface ValidateFutureDateRange {

    String message() default "Start date must be before end date";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };

}
