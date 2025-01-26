package com.yeohaeng_ttukttak.server.application.travel.service.dto;

public record TravelInvitationTokenDto (

        String invitationToken,

        int expiresIn

) { }
