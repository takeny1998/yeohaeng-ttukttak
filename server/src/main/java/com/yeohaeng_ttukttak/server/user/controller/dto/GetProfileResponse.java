package com.yeohaeng_ttukttak.server.user.controller.dto;

import com.fasterxml.jackson.annotation.JsonIncludeProperties;
import com.yeohaeng_ttukttak.server.user.domain.Gender;
import com.yeohaeng_ttukttak.server.user.domain.User;

import java.time.LocalDate;

public record GetProfileResponse(
        String nickname,
        Gender gender,
        LocalDate birthDay
) {

    public GetProfileResponse(User user) {
        this(user.getNickname(), user.getGender(), user.getBirthday());
    }
}
