package com.yeohaeng_ttukttak.server.user.controller.dto;

import com.yeohaeng_ttukttak.server.common.util.my_jwt.MyJwtUtil;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.service.UserService;
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

    private final UserService userService;

    @GetMapping("/sign-up")
    public void signUp(@RequestParam String code) {
        log.info("code={}", code);
        User user = userService.signUp(code);

    }

    @GetMapping("/revoke")
    public void revoke(@RequestParam String code) {

    }

}
