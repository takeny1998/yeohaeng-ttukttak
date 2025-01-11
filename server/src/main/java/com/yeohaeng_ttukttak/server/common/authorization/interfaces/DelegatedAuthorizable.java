package com.yeohaeng_ttukttak.server.common.authorization.interfaces;

public interface DelegatedAuthorizable<T extends Authorizable> {

    T resolve();

}
