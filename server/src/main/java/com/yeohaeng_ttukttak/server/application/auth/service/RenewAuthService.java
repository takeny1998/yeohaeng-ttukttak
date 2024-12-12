package com.yeohaeng_ttukttak.server.application.auth.service;

import com.yeohaeng_ttukttak.server.application.auth.service.dto.AuthTokenDto;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.auth.entity.RefreshToken;
import com.yeohaeng_ttukttak.server.domain.auth.service.AccessTokenService;
import com.yeohaeng_ttukttak.server.domain.auth.service.RefreshTokenService;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class RenewAuthService {

    private final AccessTokenService accessTokenService;

    private final MemberService memberService;

    private final RefreshTokenService refreshTokenService;

    @Transactional
    public AuthTokenDto call(String refreshToken) {
        final RefreshToken verifiedToken = refreshTokenService.verify(refreshToken);
        final String memberId = verifiedToken.memberId();

        refreshTokenService.revoke(verifiedToken);

        final Member member = memberService.find(memberId);
        final AuthenticationContext authorization = new AuthenticationContext(
                member.uuid(),
                member.nickname(),
                member.ageGroup(),
                member.gender());

        return new AuthTokenDto(
                accessTokenService.create(authorization),
                refreshTokenService.create(memberId));
    }

}
