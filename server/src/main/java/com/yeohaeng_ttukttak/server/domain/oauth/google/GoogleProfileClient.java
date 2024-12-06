package com.yeohaeng_ttukttak.server.domain.oauth.google;

import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;

@HttpExchange("https://people.googleapis.com/v1")
public interface GoogleProfileClient {

    @GetExchange("/people/me?personFields=birthdays,genders,nicknames")
    GoogleProfileResponse getProfile(
            @RequestHeader("Authorization") String authorization
    );

}
