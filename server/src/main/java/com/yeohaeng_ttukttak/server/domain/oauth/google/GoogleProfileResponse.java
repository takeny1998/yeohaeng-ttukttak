package com.yeohaeng_ttukttak.server.domain.oauth.google;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;

import java.time.LocalDate;

@JsonDeserialize(using = GoogleProfileDeserializer.class)
public record GoogleProfileResponse(
        LocalDate birthday, Gender gender, String nickname) { }
