package com.yeohaeng_ttukttak.server.oauth2.service;

import com.yeohaeng_ttukttak.server.oauth2.service.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuthProvider;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;

public interface OAuthProvidable {

    GetProfileResult getProfile();

    GetIdResult getIdentification(GetIdCommand command);

    OAuthProvider getProvider();

    void revoke(RevokeCommand command);

}
