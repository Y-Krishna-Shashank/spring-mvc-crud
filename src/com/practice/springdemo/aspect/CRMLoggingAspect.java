package com.practice.springdemo.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {
    //setup logger
    private Logger myLogger = Logger.getLogger(getClass().getName());
    //setup pointcut declartions
    @Pointcut("execution(* com.practice.springdemo.controller.*.*(..))")
    private void forControllerPackage(){}

    @Pointcut("execution(* com.practice.springdemo.service.*.*(..))")
    private void forServicePackage(){}

    @Pointcut("execution(* com.practice.springdemo.dao.*.*(..))")
    private void forDaoPackage(){}

    @Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
    private void forAppFlow(){}
    //add @Before advice

    @Before("forAppFlow()")
    public void before(JoinPoint theJoinPoint) {
        String theMethod = theJoinPoint.getSignature().toShortString();
        myLogger.info("\n --->>> @Before advice executing on method: "+theMethod);

    }
    //add @AfterReturning advice
}
