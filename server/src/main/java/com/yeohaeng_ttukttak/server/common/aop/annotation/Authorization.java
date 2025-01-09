package com.yeohaeng_ttukttak.server.common.aop.annotation;

import com.yeohaeng_ttukttak.server.common.aop.CrudPermission;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Authorization {

    CrudPermission[] requires() default {};

    Class<?> target();

}
