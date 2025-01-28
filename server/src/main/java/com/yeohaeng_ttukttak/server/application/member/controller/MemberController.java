package com.yeohaeng_ttukttak.server.application.member.controller;

import com.yeohaeng_ttukttak.server.application.member.controller.dto.MemberResponse;
import com.yeohaeng_ttukttak.server.application.member.controller.dto.TravelListResponse;
import com.yeohaeng_ttukttak.server.application.member.controller.dto.MemberProfileUpdateRequest;
import com.yeohaeng_ttukttak.server.application.member.service.FindMemberService;
import com.yeohaeng_ttukttak.server.application.member.service.MemberTravelService;
import com.yeohaeng_ttukttak.server.application.member.service.UpdateMemberService;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.member.dto.MemberDto;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/members")
@RequiredArgsConstructor
@Tag(name = "사용자 (Member)", description = "사용자 정보와 관련된 동작을 수행하는 컬렉션 입니다.")
public class MemberController {

    private final FindMemberService findMemberService;
    private final UpdateMemberService updateMemberService;

    private final MemberTravelService memberTravelService;

    /**
     * 지정한 사용자의 프로필을 조회합니다.
     * @param id 사용자의 식별자
     * @return 조회된 사용자 프로필
     */
    @GetMapping("/{id}")
    public MemberResponse find(@PathVariable String id) {
        final MemberDto dto = findMemberService.findOne(id);
        return new MemberResponse(dto);
    }

    /**
     * 로그인한 사용자의 프로필을 조회합니다.
     * @return 로그인한 사용자 프로필 정보
     */
    @GetMapping("/me")
    @Authentication
    public MemberResponse findMe(AuthenticationContext authorization) {
        final MemberDto dto = findMemberService.findOne(authorization.uuid());
        return new MemberResponse(dto);
    }

    @PatchMapping("/me/profile")
    @Authentication
    public MemberResponse updateProfile(
            @RequestBody MemberProfileUpdateRequest request,
            AuthenticationContext authorization) {

        updateMemberService.updateProfile(authorization.uuid(),
                request.nickname(), request.ageGroup(), request.gender());

        MemberDto dto = findMemberService.findOne(authorization.uuid());
        return new MemberResponse(dto);

    }

    /**
     * 사용자가 참여하거나 생성한 여행을 모두 조회합니다.
     * @return 조회된 여행 목록
     */
    @GetMapping("/me/travels")
    @Authentication
    public TravelListResponse findMyTravels(
            AuthenticationContext context) {

        final List<TravelDto> travelDtoList =
                memberTravelService.findByMemberId(context.uuid());

        return new TravelListResponse(travelDtoList);
    }


}
