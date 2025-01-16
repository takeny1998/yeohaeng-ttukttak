package com.yeohaeng_ttukttak.server.common.http;

import org.springframework.core.annotation.AliasFor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@RequestMapping(consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE)
public @interface JsonRequestMapping {

    @AliasFor(annotation = RequestMapping.class)
    String value() default "";

}
