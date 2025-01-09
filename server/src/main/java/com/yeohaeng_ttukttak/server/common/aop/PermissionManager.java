package com.yeohaeng_ttukttak.server.common.aop;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.*;

@Slf4j
public class PermissionManager {

    private final List<PermissionCheckable> checkers = new ArrayList<>();

    public boolean check(Object resourceId, String memberId, Class<?> targetClass, CrudPermission[] requiredPermissions) {

        boolean isChecked = false;

        for (PermissionCheckable checker : checkers) {
            if (isValidChecker(checker, targetClass, requiredPermissions)) {
                isChecked = checker.check(resourceId, memberId);
            }
        }

        return isChecked;
    }

    public void register(PermissionCheckable checkable) {
        System.out.println("PermissionCheckerManager.register");

        log.debug("[PermissionCheckerManager.register] registered target={}, supports={}",
                checkable.target().getSimpleName(),
                checkable.supports());

        checkers.add(checkable);
    }

    private boolean isValidChecker(PermissionCheckable checker, Class<?> targetClass, CrudPermission[] requiredPermissions) {
        return targetClass.isAssignableFrom(checker.target()) &&
                hasRequiredPermissions(checker, requiredPermissions);
    }

    private boolean hasRequiredPermissions(PermissionCheckable checker, CrudPermission[] requiredPermissions) {

        final Set<CrudPermission> supportedPermissions =
                new HashSet<>(Arrays.asList(checker.supports()));

        return supportedPermissions.containsAll(Arrays.asList(requiredPermissions));

    }
}