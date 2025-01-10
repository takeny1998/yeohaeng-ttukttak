package com.yeohaeng_ttukttak.server.common.authorization;

import com.yeohaeng_ttukttak.server.common.authorization.CrudOperation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.CONSTRUCTOR})
@Retention(RetentionPolicy.RUNTIME)
public @interface Authorization {

    CrudOperation[] requires() default {};

}
