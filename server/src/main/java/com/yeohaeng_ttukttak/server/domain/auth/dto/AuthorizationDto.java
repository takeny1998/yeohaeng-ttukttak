package com.yeohaeng_ttukttak.server.domain.auth.dto;

import com.yeohaeng_ttukttak.server.common.util.EnumUtil;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import lombok.NonNull;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 사용자의 인증 정보를 표현하는 DTO
 * @param memberId 사용자의 식별자
 * @param ageGroup 사용자의 연령대
 * @param gender 사용자의 성별
 * @param brithDate 사용자의 생년월일
 */
public record AuthorizationDto(
        String memberId,
        AgeGroup ageGroup,
        Gender gender,
        LocalDate brithDate) {

    public Map<String, Object> toClaims() {
        final Map<String, Object> claims = new HashMap<>(Map.of("sub", memberId));

        if (Objects.nonNull(ageGroup)) {
            claims.put("age_group", ageGroup.toString());
        }

        if (Objects.nonNull(gender)) {
            claims.put("gender", gender.toString());
        }

        if (Objects.nonNull(brithDate)) {
            claims.put("birth_date", brithDate.toString());
        }

        return claims;
    }

    public static AuthorizationDto fromClaims(Map<String, JwtClaim> claims) {

        final String memberId = JwtClaim.of(claims, "sub").asString();
        final String ageGroup = JwtClaim.of(claims, "age_group").asString();
        final String gender = JwtClaim.of(claims, "gender").asString();
        final String birthDate = JwtClaim.of(claims, "birth_date").asString();

        return new AuthorizationDto(
                memberId,
                EnumUtil.fromStringOrNull(AgeGroup.class, ageGroup),
                EnumUtil.fromStringOrNull(Gender.class, gender),
                LocalDateUtil.fromStringOrNull(birthDate)
        );
    }

}