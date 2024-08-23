package com.yeohaeng_ttukttak.server.user.service;

import com.yeohaeng_ttukttak.server.user.domain.auth.OAuthProvider;
import com.yeohaeng_ttukttak.server.user.service.dto.GetIdentificationCommand;
import com.yeohaeng_ttukttak.server.user.service.dto.Identification;
import com.yeohaeng_ttukttak.server.user.service.dto.Profile;

public interface OAuthProvidable {

    Profile getProfile();

    Identification getIdentification(
            GetIdentificationCommand command);

    OAuthProvider getProvider();

    void revoke(Identification id);

}
