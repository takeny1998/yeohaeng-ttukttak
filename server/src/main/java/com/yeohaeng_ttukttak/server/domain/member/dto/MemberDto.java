package com.yeohaeng_ttukttak.server.domain.member.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;

public record MemberDto(
        String uuid,
        String nickname,
        AgeGroup ageGroup,
        Gender gender,
        AvatarDto avatar
) {

    public static MemberDto of(String host, Member member) {
        return new MemberDto(
                member.uuid(),
                member.nickname(),
                member.ageGroup(),
                member.gender(),
                AvatarDto.of(host, member.avatar()));
    }

}
