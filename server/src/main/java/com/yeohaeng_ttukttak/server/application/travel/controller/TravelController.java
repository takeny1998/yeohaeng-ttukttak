package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindMyAllTravelResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelDetailResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindMyAllTravelService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelsByCityService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelDetailService;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.FindTravelsByCityResponse;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController {

    private final CreateTravelService createTravelService;
    private final FindTravelsByCityService findTravelsByCityService;
    private final FindTravelDetailService findTravelDetailService;
    private final FindMyAllTravelService findMyAllTravelService;

    @PostMapping
    @Authorization
    public ServerResponse<Void> create(
            @RequestBody @Valid CreateTravelRequest request,
            AccessTokenDto accessToken
    ) {
        log.debug("[TravelController.create] request = {}", request);
        log.debug("[TravelController.create] accessToken = {}", accessToken);

        createTravelService.call(request.toCommand(accessToken.memberId()));

        return new ServerResponse<>();
    }

    @GetMapping
    public ServerResponse<FindTravelsByCityResponse> findAllByCity(@RequestParam("cityId") Long cityId) {
        List<TravelDto> dtos = findTravelsByCityService.call(cityId);

        return new ServerResponse<>(
                new FindTravelsByCityResponse(dtos));
    }

    @GetMapping("/{id}/detail")
    public ServerResponse<FindTravelDetailResponse> findDetail(
            @PathVariable Long id) {
        return new ServerResponse<>(
                findTravelDetailService.call(id).toResponse());
    }

    @GetMapping("/members/me")
    @Authorization
    public ServerResponse<FindMyAllTravelResponse> findMyAll(
            AccessTokenDto accessToken
    ) {

        log.debug("{}", accessToken.memberId());

       return new ServerResponse<>(
               new FindMyAllTravelResponse(
                       findMyAllTravelService.call(accessToken.memberId())));
    }

}
