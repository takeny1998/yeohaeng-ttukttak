package com.yeohaeng_ttukttak.server.user.controller;

import com.yeohaeng_ttukttak.server.user.controller.dto.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v2/users")
public class UserController {

    @GetMapping("/profile")
    public GetProfileResponse getProfile(User user) {
        log.debug("{}", user);
        return new GetProfileResponse(user);
    }

}
