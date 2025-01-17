package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.RecommendTravelResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRecommendRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@JsonRequestMapping("/api/v2/travels/recommendations")
@RequiredArgsConstructor
public class TravelRecommendationsController {

    private final TravelRecommendRepository repository;

    @GetMapping
    @Transactional(readOnly = true)
    public ServerResponse<RecommendTravelResponse> recommend(
            @RequestParam Long cityId,
            @RequestParam List<MotivationType> motivationTypes,
            @RequestParam List<CompanionType> companionTypes,
            @RequestParam int pageSize,
            @RequestParam int pageNumber
    ) {
        PageCommand pageCommand = new PageCommand(pageSize, pageNumber);

        final PageResult<Travel> pageResult = repository.call(
                cityId, motivationTypes, companionTypes, pageCommand);

        return new ServerResponse<>(RecommendTravelResponse.of(pageResult));

    }


}
