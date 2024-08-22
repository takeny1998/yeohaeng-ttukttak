package com.yeohaeng_ttukttak.server.user.service.client;

import com.yeohaeng_ttukttak.server.user.service.client.dto.GetProfileResponse;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;


@Component
@HttpExchange("https://people.googleapis.com/v1")
public interface GoogleProfileClient {

    @GetExchange("/people/me?personFields=birthdays,genders")
    GetProfileResponse getProfile();

}
