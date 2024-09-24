package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelService;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController {

    private final CreateTravelService createTravelService;

    @PostMapping("/")
    @Authorization
    public void create(
            @RequestBody @Valid CreateTravelRequest request,
            AccessTokenDto accessToken
    ) {
        log.debug("[TravelController.create] request = {}", request);
        log.debug("[TravelController.create] accessToken = {}", accessToken);

        createTravelService.call(request.toCommand(accessToken.memberId()));

    }

}
