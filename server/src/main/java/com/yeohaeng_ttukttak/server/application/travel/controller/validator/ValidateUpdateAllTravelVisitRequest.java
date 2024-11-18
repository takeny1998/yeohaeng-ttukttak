package com.yeohaeng_ttukttak.server.application.travel.controller.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UpdateAllTravelVisitRequestValidator.class)
public @interface ValidateUpdateAllTravelVisitRequest {

    String message() default "Invalid visits data";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
