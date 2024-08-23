package com.yeohaeng_ttukttak.server.user.service;

import com.yeohaeng_ttukttak.server.user.service.dto.RegisterResult;

public interface AuthService {

    RegisterResult register(String code);

    void revoke(String code);

}
