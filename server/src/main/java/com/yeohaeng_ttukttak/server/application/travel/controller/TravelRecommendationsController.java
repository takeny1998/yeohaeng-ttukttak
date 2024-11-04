package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.RecommendTravelResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentException;
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
import java.util.Objects;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels/recommendations")
@RequiredArgsConstructor
public class TravelRecommendationsController {

    private final TravelRecommendRepository repository;

    @GetMapping
    public ServerResponse<RecommendTravelResponse> recommend(
            @RequestParam Long cityId,
            @RequestParam(required = false) List<TravelMotivationType> motivationTypes,
            @RequestParam(required = false) List<TravelCompanionType> companionTypes,
            @RequestParam int pageSize,
            @RequestParam int pageNumber
    ) {

        final boolean isCompanionTypeNull = Objects.isNull(companionTypes);
        final boolean isMotivationNull = Objects.isNull(motivationTypes);

        log.debug("motivations = {}", motivationTypes);
        log.debug("companionTypes = {}", companionTypes);

        if (isMotivationNull && isCompanionTypeNull) {
            throw new InvalidArgumentException();
        }

        PageCommand pageCommand = new PageCommand(pageSize, pageNumber);

        final PageResult<Travel> pageResult = repository.call(
                cityId, motivationTypes, companionTypes, pageCommand);

        return new ServerResponse<>(RecommendTravelResponse.of(pageResult));

    }


}
