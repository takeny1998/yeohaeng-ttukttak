package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.FindTravelDetailResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.CreateTravelService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindAllTravelByCityService;
import com.yeohaeng_ttukttak.server.application.travel.service.FindTravelDetailService;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AccessTokenDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels")
@RequiredArgsConstructor
public class TravelController {

    private final CreateTravelService createTravelService;
    private final FindAllTravelByCityService findAllTravelByCityService;
    private final FindTravelDetailService findTravelDetailService;

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
    public ServerResponse<List<TravelDto>> findAllByCity(@RequestParam("cityId") Long cityId) {
        return new ServerResponse<>(
                findAllTravelByCityService.call(cityId));
    }

    @GetMapping("/{id}/detail")
    public ServerResponse<FindTravelDetailResponse> findDetail(
            @PathVariable("id") Long id) {
        return new ServerResponse<>(
                findTravelDetailService.call(id).toResponse());
    }

}
