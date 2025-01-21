package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.PlaceRecommendationResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRecommendationsRepository;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
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
    public ServerSuccessResponse<PlaceRecommendationResponse> recommendPlaces(
            PageCommand pageCommand,
            @RequestParam Long cityId,
            @RequestParam PlaceCategoryType categoryType,
            @RequestParam List<MotivationType> motivationTypes,
            @RequestParam List<CompanionType> companionTypes) {

        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);


        log.debug("{} {}", motivationTypes, companionTypes);

        PageResult<Place> pageResult = placeRecommendationsRepository.call(
                categoryType,
                geography.codeStart(), geography.codeEnd(),
                motivationTypes,
                companionTypes,
                pageCommand);

        return new ServerSuccessResponse<>(PlaceRecommendationResponse.of(pageResult));
    }

}
