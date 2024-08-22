package com.yeohaeng_ttukttak.server.user.controller.dto;

import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.service.GoogleAuthService;
import com.yeohaeng_ttukttak.server.user.service.dto.RegisterResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v2/users")
@RequiredArgsConstructor
public class UserController {

    private final GoogleAuthService googleAuthService;

    @GetMapping("/google/register")
    public RegisterResult register(@RequestParam String code) {
        log.debug("code={}", code);
        RegisterResult result = googleAuthService.register(code);
        return result;
    }

    @GetMapping("/google/revoke")
    public void revoke(@RequestParam String code) {

    }

}
