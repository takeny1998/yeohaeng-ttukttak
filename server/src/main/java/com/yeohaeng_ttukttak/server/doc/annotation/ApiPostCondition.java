package com.yeohaeng_ttukttak.server.doc.annotation;

import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Repeatable(ApiPostConditions.class)
public @interface ApiPostCondition {

    String value();

}
