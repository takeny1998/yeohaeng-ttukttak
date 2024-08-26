package com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.get_profile;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.yeohaeng_ttukttak.server.user.domain.Gender;

import java.time.LocalDate;

@JsonDeserialize(using = GoogleGetProfileResponseDeserializer.class)
public record GetProfileResponse (
        LocalDate birthday,
        Gender gender
) { }