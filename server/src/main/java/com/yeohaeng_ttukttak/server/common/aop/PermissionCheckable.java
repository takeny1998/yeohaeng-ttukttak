package com.yeohaeng_ttukttak.server.common.aop;

public interface PermissionCheckable {

    boolean check(Object targetId, String memberId);

    CrudPermission[] supports();

    Class<?> target();

}
