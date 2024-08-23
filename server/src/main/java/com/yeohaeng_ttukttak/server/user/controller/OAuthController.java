package com.yeohaeng_ttukttak.server.user.controller;

import com.yeohaeng_ttukttak.server.common.exception.exception.RequiredFieldMissingException;
import com.yeohaeng_ttukttak.server.common.util.MapUtil;
import com.yeohaeng_ttukttak.server.user.controller.dto.OAuthRequest;
import com.yeohaeng_ttukttak.server.user.service.OAuthService;
import com.yeohaeng_ttukttak.server.user.service.dto.RegisterResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Slf4j
@RestController
@RequestMapping("/api/v2/users")
@RequiredArgsConstructor
public class OAuthController {

    private final OAuthService googleOAuthService;
    private final OAuthService appleOAuthService;

    @GetMapping("/google")
    public ResponseEntity google(@RequestParam Map<String, String> params) {

        log.debug("Google");
        log.debug("code={}", params.get("code"));

        Map<String, String> state = MapUtil.parse(params.get("state"));

        log.debug("state={}", state);

        String code = Optional.ofNullable(params.get("code"))
                .orElseThrow(() -> new RequiredFieldMissingException("code"));

        String action = state.get("action");

        if (Objects.equals(action, "register")) {
            RegisterResult result = googleOAuthService.register(code);
            return ResponseEntity.ok(result);
        }

        if (Objects.equals(action, "revoke")) {
            googleOAuthService.revoke(code);
            return ResponseEntity.noContent().build();
        }

        throw new RequiredFieldMissingException("action");

    }

    @GetMapping("/apple")
    public ResponseEntity apple(@RequestParam Map<String, String> params) {

        log.debug("Apple");
        log.debug("code={}", params.get("code"));

        Map<String, String> state = MapUtil.parse(params.get("state"));

        log.debug("state={}", state);

        String code = Optional.ofNullable(params.get("code"))
                .orElseThrow(() -> new RequiredFieldMissingException("code"));

        String action = state.get("action");

        if (Objects.equals(action, "register")) {
            RegisterResult result = appleOAuthService.register(code);
            return ResponseEntity.ok(result);
        }

        if (Objects.equals(action, "revoke")) {
            appleOAuthService.revoke(code);
            return ResponseEntity.noContent().build();
        }

        throw new RequiredFieldMissingException("action");

    }


}
