package com.yeohaeng_ttukttak.server.domain.member.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;

public record MemberDto(
        String id,
        AgeGroup ageGroup,
        Gender gender
) {

    public static MemberDto of(Member member) {
        return new MemberDto(
                member.id(), member.ageGroup(), member.gender());
    }

}
