package com.yeohaeng_ttukttak.server.common.aop;

import org.aspectj.lang.annotation.Pointcut;

public class Pointcuts {

    @Pointcut("execution(* com.yeohaeng_ttukttak.server..*Controller.*(..))")
    public void controllerPointcut() {}

    @Pointcut("execution(* *(.., @annotation.Authorization (*), ..))")
    public void authorizationPointcut() {}

}
