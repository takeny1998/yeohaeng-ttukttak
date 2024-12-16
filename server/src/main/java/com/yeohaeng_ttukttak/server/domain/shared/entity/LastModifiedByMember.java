package com.yeohaeng_ttukttak.server.domain.shared.entity;

import org.hibernate.annotations.ValueGenerationType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@ValueGenerationType(generatedBy = LastModifiedByMemberGenerator.class)
public @interface LastModifiedByMember { }
