package com.yeohaeng_ttukttak.server.user.service.dto;

import com.yeohaeng_ttukttak.server.user.domain.Gender;

import java.time.LocalDate;

public record Profile(
        Gender gender,
        LocalDate birthday
) { }

