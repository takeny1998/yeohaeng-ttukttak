package com.yeohaeng_ttukttak.server.common.authorization.interfaces;

import com.yeohaeng_ttukttak.server.common.authorization.CrudOperation;

/**
 * 사용자 역할에 대한 대상 도메인과 허용 작업을 검증하는 인터페이스입니다.
 *
 * @param <T> 적용할 도메인 클래스
 */
public interface RoleBasedPermission<T extends Authorizable> {

    /**
     * 지정된 대상에게 권한을 부여할 수 있는지 여부를 확인합니다.
     *
     * @param target 권한을 부여할 대상 객체
     * @param memberId 권한을 부여할 사용자의 ID
     * @return 권한 부여가 가능하면 true, 불가능하면 false
     */
    boolean checkGrantable(T target, String memberId);

    /**
     * 역할에 의해 허용된 작업 목록을 반환합니다.
     *
     * @return 허용된 작업의 배열
     */
    CrudOperation[] getAllowedOperations();

    /**
     * 해당 권한이 작동하는 도메인 클래스를 반환합니다.
     *
     * @return 대상 클래스의 타입
     */
    Class<T> getTargetClass();

}
