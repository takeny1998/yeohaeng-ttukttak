package com.yeohaeng_ttukttak.server.domain.shared.interfaces;

public interface DelegatedAuthorizable<T extends Authorizable<T>> {

    T resolve();

}
