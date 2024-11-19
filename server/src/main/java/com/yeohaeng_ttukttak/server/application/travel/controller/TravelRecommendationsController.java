package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.RecommendTravelResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelMotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRecommendRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels/recommendations")
@RequiredArgsConstructor
public class TravelRecommendationsController {

    private final TravelRecommendRepository repository;

    @GetMapping
    public ServerResponse<RecommendTravelResponse> recommend(
            @RequestParam Long cityId,
            List<TravelMotivationType> motivationTypes,
            List<TravelCompanionType> companionTypes,
            @RequestParam int pageSize,
            @RequestParam int pageNumber
    ) {
        PageCommand pageCommand = new PageCommand(pageSize, pageNumber);

        final PageResult<Travel> pageResult = repository.call(
                cityId, motivationTypes, companionTypes, pageCommand);

        return new ServerResponse<>(RecommendTravelResponse.of(pageResult));

    }


}
