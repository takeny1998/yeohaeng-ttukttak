package com.yeohaeng_ttukttak.server.application.auth.service;

import com.yeohaeng_ttukttak.server.application.auth.service.dto.AuthTokenDto;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthorizationDto;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.auth.service.RefreshTokenService;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.jwt.service.JwtService;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.member.service.NicknameService;
import com.yeohaeng_ttukttak.server.domain.oauth.service.OAuthService;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.ProfileDto;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.TokenDto;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuth;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

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
    public AuthTokenDto call(String authorizationCode) {

        final TokenDto tokenDto = oauthService.getToken(authorizationCode);

        final Map<String, JwtClaim> claims = jwtService.decode(tokenDto.idToken());

        final JwtClaim subClaim = claims.get("sub");
        final String openId = subClaim != null ? subClaim.asString() : null;

        final Member member = memberRepository.findByOpenId(openId)
                .orElseGet(() -> createMember(openId, tokenDto.accessToken()));

        log.debug("[OAuthLoginService.login] member = {}", member);

        final AuthorizationDto authorization = new AuthorizationDto(
                member.uuid(),
                member.nickname(),
                member.ageGroup(),
                member.gender());

        final String accessToken = accessTokenService.create(authorization);
        final String refreshToken = refreshTokenService.create(member.uuid());

        log.debug("[OAuthLoginService.login] accessToken = {}", accessToken);

        return new AuthTokenDto(accessToken, refreshToken);

    }

    private Member createMember(String openId, String accessToken) {

        final ProfileDto profileDto = oauthService.getProfile(accessToken);
        final OAuth oauth = new OAuth(openId, oauthService.getProvider());

        final String nickname = Objects.nonNull(profileDto.nickname())
                ? profileDto.nickname()
                : nicknameService.generate();

        return memberRepository.save(
                new Member(oauth, nickname, profileDto.gender(), profileDto.birthDate()));
    }

}
