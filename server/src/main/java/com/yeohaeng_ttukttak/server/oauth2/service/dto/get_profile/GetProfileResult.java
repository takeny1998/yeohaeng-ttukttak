package com.yeohaeng_ttukttak.server.oauth2.service.dto.get_profile;

import com.yeohaeng_ttukttak.server.user.domain.Gender;

import java.time.LocalDate;

public record GetProfileResult(
        Gender gender,
        LocalDate birthday
) { }

