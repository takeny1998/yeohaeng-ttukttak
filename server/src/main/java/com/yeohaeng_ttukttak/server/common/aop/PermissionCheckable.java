package com.yeohaeng_ttukttak.server.common.aop;

public interface PermissionCheckable<T> {

    boolean check(T target, String memberId);

    CrudPermission[] supports();

    Class<T> target();

}
