package com.yeohaeng_ttukttak.server.domain.auth.dto;

import com.yeohaeng_ttukttak.server.common.util.EnumUtil;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 사용자의 인증 정보를 표현하는 DTO
 * @param uuid 사용자의 식별자
 * @param nickname 사용자 닉네임
 * @param ageGroup 사용자의 연령대
 * @param gender 사용자의 성별
 */
public record AuthenticationContext(
        String uuid,
        String nickname,
        AgeGroup ageGroup,
        Gender gender) {

    public Map<String, Object> toClaims() {
        final Map<String, Object> claims = new HashMap<>(Map.of("sub", uuid));

        if (Objects.nonNull(ageGroup)) {
            claims.put("age_group", ageGroup.toString());
        }

        if (Objects.nonNull(nickname)) {
            claims.put("nickname", nickname);
        }

        if (Objects.nonNull(gender)) {
            claims.put("gender", gender.toString());
        }

        return claims;
    }

    public static AuthenticationContext fromClaims(Map<String, JwtClaim> claims) {

        final String ageGroup = JwtClaim.of(claims, "age_group").asString();
        final String gender = JwtClaim.of(claims, "gender").asString();

        return new AuthenticationContext(
                JwtClaim.of(claims, "sub").asString(),
                JwtClaim.of(claims, "nickname").asString(),
                EnumUtil.fromStringOrNull(AgeGroup.class, ageGroup),
                EnumUtil.fromStringOrNull(Gender.class, gender)
        );
    }

}