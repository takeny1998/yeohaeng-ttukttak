package com.yeohaeng_ttukttak.server.application.auth.service;

import com.yeohaeng_ttukttak.server.application.auth.service.dto.AuthTokenDto;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.auth.service.RefreshTokenService;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.jwt.service.JwtService;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.nickname.Nickname;
import com.yeohaeng_ttukttak.server.domain.nickname.NicknameService;
import com.yeohaeng_ttukttak.server.domain.oauth.service.OAuthService;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.ProfileDto;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuth;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import java.util.Locale;
import java.util.Map;
import java.util.Objects;

@Slf4j
@RequiredArgsConstructor
public class OAuthLoginService {

    private final OAuthService oauthService;
    private final JwtService jwtService;

    private final AccessTokenService accessTokenService;
    private final RefreshTokenService refreshTokenService;

    private final NicknameService nicknameService;
    private final MemberRepository memberRepository;

    @Transactional
    public AuthTokenDto call(String authorizationCode, Locale locale) {

        final TokenDto tokenDto = oauthService.getToken(authorizationCode);

        final Map<String, JwtClaim> claims = jwtService.decode(tokenDto.idToken());

        final JwtClaim subClaim = claims.get("sub");
        final String openId = subClaim != null ? subClaim.asString() : null;

        final Member member = memberRepository.findByOpenId(openId)
                .orElseGet(() -> createMember(locale, openId, tokenDto.accessToken()));

        log.debug("[OAuthLoginService.login] member = {}", member);

        final AuthenticationContext authorization = AuthenticationContext.of(member);

        final String accessToken = accessTokenService.create(authorization);
        final String refreshToken = refreshTokenService.create(member.uuid());

        log.debug("[OAuthLoginService.login] accessToken = {}", accessToken);

        return new AuthTokenDto(accessToken, refreshToken);

    }

    private Member createMember(Locale locale, String openId, String accessToken) {
        final ProfileDto profileDto = oauthService.getProfile(accessToken);
        final OAuth oauth = new OAuth(openId, oauthService.getProvider());

        final Nickname nickname = Objects.nonNull(profileDto.nickname())
                ? nicknameService.create(profileDto.nickname())
                : nicknameService.generate(locale);

        return memberRepository.save(
                new Member(oauth, nickname, profileDto.gender(), profileDto.birthDate()));
    }

}
