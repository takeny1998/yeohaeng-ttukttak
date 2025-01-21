package com.yeohaeng_ttukttak.server.application.member.controller.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;

public record MemberProfileUpdateRequest(
        String nickname,
        AgeGroup ageGroup,
        Gender gender
) { }
