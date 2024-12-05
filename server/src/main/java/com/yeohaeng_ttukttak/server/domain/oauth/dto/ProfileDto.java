package com.yeohaeng_ttukttak.server.domain.oauth.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;

import java.time.LocalDate;

public record ProfileDto(
        LocalDate birthDate,
        Gender gender,
        String nickname
) { }
