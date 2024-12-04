package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.PlaceRecommendationResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRecommendationsRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelMotivationType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Transactional(readOnly = true)
@RestController
@RequestMapping("/api/v2/places/recommendations")
@RequiredArgsConstructor
public class PlaceRecommendationsController {

    private final GeographyRepository geographyRepository;
    private final PlaceRecommendationsRepository placeRecommendationsRepository;

    @GetMapping
    public ServerResponse<PlaceRecommendationResponse> recommendPlaces(
            PageCommand pageCommand,
            @RequestParam Long cityId,
            @RequestParam PlaceCategoryType categoryType,
            @RequestParam List<TravelMotivationType> motivationTypes,
            @RequestParam List<TravelCompanionType> companionTypes) {

        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(() -> new EntityNotFoundFailException(Geography.class));


        log.debug("{} {}", motivationTypes, companionTypes);

        PageResult<Place> pageResult = placeRecommendationsRepository.call(
                categoryType,
                geography.codeStart(), geography.codeEnd(),
                motivationTypes,
                companionTypes,
                pageCommand);

        return new ServerResponse<>(PlaceRecommendationResponse.of(pageResult));
    }

}
