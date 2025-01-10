package com.yeohaeng_ttukttak.server.common.aop;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashSet;
import java.util.List;
import java.util.*;

@Slf4j
@RequiredArgsConstructor
public class PermissionManager {

    private final List<PermissionCheckable<?>> checkers = new ArrayList<>();

    /**
     * 제공된 target이 등록된 체크러에 따라 필요한 권한을 가지고 있는지 확인합니다.
     *
     * @param target              권한을 체크할 대상 객체입니다.
     * @param memberId           권한을 체크할 멤버의 ID입니다.
     * @param requiredPermissions 체크할 필요한 권한의 배열입니다.
     * @param <T>                대상 객체의 타입입니다.
     * @return 대상이 필요한 권한을 가지고 있으면 true, 그렇지 않으면 false를 반환합니다.
     */
    public <T> boolean check(T target, String memberId, CrudPermission[] requiredPermissions) {
        boolean permitted = false;

        for (PermissionCheckable<?> checker : checkers) {
            // 대상 클래스가 호환되는지 검색합니다.
            if (!checker.target().isAssignableFrom(target.getClass())) continue;

            @SuppressWarnings("unchecked")
            final PermissionCheckable<T> resolvedChecker = (PermissionCheckable<T>) checker;

            // 필요한 권한을 지원하는지 확인합니다.
            final boolean supportsPermissions = supportsPermissions(checker, requiredPermissions);
            if (!supportsPermissions) continue;

            permitted = resolvedChecker.check(target, memberId);
            if (permitted) return permitted;
        }

        return permitted;
    }

    /**
     * 새로운 PermissionCheckable 인스턴스를 등록하여 권한 체크에 사용합니다.
     *
     * @param checkable 등록할 PermissionCheckable 인스턴스입니다.
     */
    public void register(PermissionCheckable<?> checkable) {
        log.debug("[PermissionCheckerManager.register] Target={}, Supports={}",
                checkable.target().getSimpleName(),
                checkable.supports());
        checkers.add(checkable);
    }

    /**
     * 주어진 PermissionCheckable이 필요한 모든 권한을 지원하는지 확인합니다.
     *
     * @param checker             확인할 PermissionCheckable 인스턴스입니다.
     * @param requiredPermissions 체크할 필요한 권한의 배열입니다.
     * @return 체크러가 모든 필요한 권한을 지원하면 true, 그렇지 않으면 false를 반환합니다.
     */
    private boolean supportsPermissions(PermissionCheckable<?> checker, CrudPermission[] requiredPermissions) {
        final Set<CrudPermission> supportedPermissions =
                new HashSet<>(Arrays.asList(checker.supports()));
        return supportedPermissions.containsAll(Arrays.asList(requiredPermissions));
    }
}