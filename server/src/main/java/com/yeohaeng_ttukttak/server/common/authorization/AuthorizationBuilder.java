package com.yeohaeng_ttukttak.server.common.authorization;

import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Role;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class AuthorizationBuilder {

    private final String memberId;

    private boolean hasAnyRole = false;

    public AuthorizationBuilder(final String memberId) {
        this.memberId = memberId;
    }

    public AuthorizationBuilder or(final Role role) {
        if (hasAnyRole) return this;

        hasAnyRole = role.checkGrantable(memberId);
        return this;
    }


    public void authorize() {
        if (!hasAnyRole) {
            throw ExceptionCode.AUTHORIZATION_FAIL.wrap();
        }
    }

}
