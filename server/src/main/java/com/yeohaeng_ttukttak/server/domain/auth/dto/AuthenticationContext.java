package com.yeohaeng_ttukttak.server.domain.auth.dto;

import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * 사용자의 인증 정보를 표현하는 DTO
 */
public record AuthenticationContext(Optional<Member> member, String uuid) {

    public Map<String, Object> toClaims() {
        return new HashMap<>(Map.of("sub", uuid));
    }


    public static AuthenticationContext of(Member member) {
        return new AuthenticationContext(Optional.ofNullable(member), member.uuid());
    }

    public static AuthenticationContext fromClaims(Map<String, JwtClaim> claims) {

        return new AuthenticationContext(
                Optional.empty(),
                JwtClaim.of(claims, "sub").asString());
    }


}