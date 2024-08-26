package com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client;

import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.get_profile.GetProfileResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;


@Component
@HttpExchange("https://people.googleapis.com/v1")
public interface GoogleProfileClient {

    @GetExchange("/people/me?personFields=birthdays,genders")
    GetProfileResponse getProfile();

}
