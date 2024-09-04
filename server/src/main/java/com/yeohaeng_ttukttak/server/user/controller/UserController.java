package com.yeohaeng_ttukttak.server.user.controller;

import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.user.controller.dto.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.domain.User;
import com.yeohaeng_ttukttak.server.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("/api/v2/users")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    @GetMapping("/profile")
    public ServerResponse<GetProfileResponse> getProfile(@Authorization String userId) {
        log.debug("userId={}", userId);

        User user = userRepository.findById(UUID.fromString(userId))
                .orElseThrow(EntityNotFoundException::new);

        return new ServerResponse<>(new GetProfileResponse(user));
    }

//    @GetMapping("/profile")
//    public ServerResponse<Void> test() {
//        throw new EntityNotFoundException();
//    }

}
