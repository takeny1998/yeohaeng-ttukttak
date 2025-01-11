package com.yeohaeng_ttukttak.server.common.authorization;

import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Authorizable;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.RoleBasedPermission;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashSet;
import java.util.List;
import java.util.*;

@Slf4j
@RequiredArgsConstructor
public class RoleBasedPermissionManager {

    private final List<RoleBasedPermission<?>> permissions = new ArrayList<>();

    /**
     * 주어진 대상에 대해 권한을 확인합니다.
     *
     * @param target              권한을 확인할 대상 객체
     * @param memberId           권한을 확인할 멤버의 ID
     * @param requiredPermissions 확인할 필요한 권한의 배열
     * @param <T>                허용 가능한 대상 도메인 타입
     * @return 권한이 부여 가능하면 true, 그렇지 않으면 false
     */
    public <T extends Authorizable> boolean check(Object target, String memberId, CrudOperation[] requiredPermissions) {
        boolean permitted = false;

        for (RoleBasedPermission<?> checker : permissions) {
            // 대상 클래스 및 권한이 호환되는지 검색합니다.
            if (!checker.getTargetClass().isAssignableFrom(target.getClass())) continue;
            if (!supportsOperations(checker, requiredPermissions)) continue;

            @SuppressWarnings("unchecked")
            final RoleBasedPermission<T> resolvedChecker = (RoleBasedPermission<T>) checker;

            @SuppressWarnings("unchecked")
            final T resovledTarget = (T) target;

            permitted = resolvedChecker.checkGrantable(resovledTarget, memberId);

            if (permitted) return permitted;
        }

        return permitted; // 최종 권한 상태를 반환합니다.
    }

    /**
     * 새로운 RoleBasedPermission 인스턴스를 등록합니다.
     *
     * @param permission 등록할 RoleBasedPermission 인스턴스
     */
    public void register(RoleBasedPermission<?> permission) {
        permissions.add(permission); // 등록된 권한을 리스트에 추가합니다.
    }

    /**
     * 주어진 RoleBasedPermission이 필요한 권한을 지원하는지 확인합니다.
     *
     * @param checker             확인할 RoleBasedPermission 인스턴스
     * @param requiredPermissions 확인할 필요한 권한의 배열
     * @return 필요한 권한을 모두 지원하면 true, 그렇지 않으면 false
     */
    private boolean supportsOperations(RoleBasedPermission<?> checker, CrudOperation[] requiredPermissions) {
        final Set<CrudOperation> supportedPermissions =
                new HashSet<>(Arrays.asList(checker.getAllowedOperations()));

        return supportedPermissions.containsAll(Arrays.asList(requiredPermissions));
    }
}