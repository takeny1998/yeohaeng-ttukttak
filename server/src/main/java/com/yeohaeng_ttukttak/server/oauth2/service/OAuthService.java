package com.yeohaeng_ttukttak.server.oauth2.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RevokeCommand;
import com.yeohaeng_ttukttak.server.token.property.JwtProperties;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuth;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdCommand;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_id.GetIdResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile.GetProfileResult;
import com.yeohaeng_ttukttak.server.oauth2.service.dto.RegisterResult;
import com.yeohaeng_ttukttak.server.token.TokenService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;


@Slf4j
@RequiredArgsConstructor
public class OAuthService {

    private final JwtProperties jwtProps;

    private final OAuthProvidable oauthProvider;
    private final UserRepository userRepository;
    private final TokenService tokenService;

    public RegisterResult register(String code) {

        GetIdResult getIdResult = oauthProvider.getIdentification(
                new GetIdCommand(code));

        String openId = getIdResult.id();
        String name = getIdResult.name();

        User user = userRepository.findByOpenId(openId)
                .orElseGet(() -> {
                    GetProfileResult getProfileResult = oauthProvider.getProfile();
                    OAuth oauth = new OAuth(openId, oauthProvider.getProvider());
                    User newUser = new User(oauth, name, getProfileResult.gender(), getProfileResult.birthday());

                    userRepository.save(newUser);
                    return newUser;
                });

        log.debug("user={}", user);

        Map<String, Object> claims = Map.of("open_id", openId);

        return new RegisterResult(
                tokenService.issueByHS256(jwtProps.accessToken().expiration(), claims),
                tokenService.issueByHS256(jwtProps.refreshToken().expiration(), claims));
    }

    public void revoke(String code) {

        GetIdResult getIdResult =
                oauthProvider.getIdentification(new GetIdCommand(code));

        oauthProvider.revoke(new RevokeCommand(getIdResult.token()));

        User user = userRepository.findByOpenId(getIdResult.id())
                .orElseThrow(() -> new EntityNotFoundException(User.class));

        // TODO: Soft Delete 를 구현해 회원 탈퇴/정지 기록을 보존한다.
        userRepository.delete(user);

    }

}
