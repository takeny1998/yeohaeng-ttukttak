package com.yeohaeng_ttukttak.server.user.service.client.dto;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.yeohaeng_ttukttak.server.user.service.client.dto.deserializer.GoogleGetProfileResponseDeserializer;
import com.yeohaeng_ttukttak.server.user.domain.Gender;

import java.time.LocalDate;

@JsonDeserialize(using = GoogleGetProfileResponseDeserializer.class)
public record GetProfileResponse (
        LocalDate birthday,
        Gender gender
) { }