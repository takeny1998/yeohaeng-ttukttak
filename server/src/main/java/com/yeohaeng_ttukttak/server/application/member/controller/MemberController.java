package com.yeohaeng_ttukttak.server.application.member.controller;

import com.yeohaeng_ttukttak.server.application.member.controller.dto.MemberResponse;
import com.yeohaeng_ttukttak.server.application.member.controller.dto.UpdateMemberProfileRequest;
import com.yeohaeng_ttukttak.server.application.member.service.FindMemberService;
import com.yeohaeng_ttukttak.server.application.member.service.UpdateMemberService;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2/members")
@RequiredArgsConstructor
public class MemberController {

    private final FindMemberService findMemberService;
    private final UpdateMemberService updateMemberService;

    @GetMapping("/{id}")
    public ServerResponse<MemberResponse> find(@PathVariable String id) {
        final MemberDto dto = findMemberService.findOne(id);
        return new ServerResponse<>(new MemberResponse(dto));
    }

    @GetMapping("/me")
    @Authorization
    public ServerResponse<MemberResponse> findMe(AuthenticationContext authorization) {
        final MemberDto dto = findMemberService.findOne(authorization.uuid());
        return new ServerResponse<>(new MemberResponse(dto));
    }

    @PatchMapping("/me/profile")
    @Authorization
    public ServerResponse<MemberResponse> updateProfile(
            @RequestBody UpdateMemberProfileRequest request,
            AuthenticationContext authorization) {

        updateMemberService.updateProfile(authorization.uuid(),
                request.nickname(), request.ageGroup(), request.gender());

        MemberDto dto = findMemberService.findOne(authorization.uuid());
        return new ServerResponse<>(new MemberResponse(dto));

    }

}
