package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentException;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;
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
    public ServerResponse<List<TravelDto>> recommend(
            @RequestParam Long cityId,
            @RequestParam(required = false) List<Motivation> motivations,
            @RequestParam(required = false) List<CompanionType> companionTypes
//            @RequestParam int pageSize,
//            @RequestParam int pageNumber
    ) {

        final boolean isCompanionTypeNull = Objects.isNull(companionTypes);
        final boolean isMotivationNull = Objects.isNull(motivations);

        log.debug("motivations = {}", motivations);
        log.debug("companionTypes = {}", companionTypes);

        if ((!isMotivationNull && !isCompanionTypeNull)
                || (isMotivationNull && isCompanionTypeNull)) {
            throw new InvalidArgumentException();
        }

        final List<Travel> travels = !isMotivationNull
                ? repository.byMotivations(cityId, motivations)
                : repository.byCompanionTypes(cityId, companionTypes);

        log.debug("{}", travels.size());

        return new ServerResponse<>(travels.stream().map(TravelDto::of).toList());

    }


}
