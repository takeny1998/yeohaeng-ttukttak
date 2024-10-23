package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.PlaceRecommendationResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRecommendationsRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@Slf4j
@RestController
@RequestMapping("/api/v2/places/recommendations")
@RequiredArgsConstructor
public class PlaceRecommendationsController {

    private final GeographyRepository geographyRepository;
    private final PlaceRecommendationsRepository placeRecommendationsRepository;

    @Transactional(readOnly = true)
    @GetMapping
    public ServerResponse<PlaceRecommendationResponse> recommendPlace(
            @RequestParam Long cityId,
            @RequestParam PlaceCategory category,
            @RequestParam(required = false) Motivation motivation,
            @RequestParam(required = false) CompanionType companionType) {

        if (Objects.nonNull(motivation) && Objects.nonNull(companionType)) {
            throw new InvalidArgumentException();
        }

        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(EntityNotFoundException::new);

        if (Objects.nonNull(motivation)) {
            List<Place> places = placeRecommendationsRepository.byMotivationOrderByRatio(
                    category, geography.codeStart(), geography.codeEnd(), motivation);

            return toResponse(places);
        }

        List<Place> places = placeRecommendationsRepository.byCompanionTypeOrderByRatio(
                        category, geography.codeStart(), geography.codeEnd(), companionType);

        return toResponse(places);
    }

    private ServerResponse<PlaceRecommendationResponse> toResponse(List<Place> places) {
        return new ServerResponse<>(new PlaceRecommendationResponse(
                places.stream()
                        .map(PlaceDto::of)
                        .toList()
        ));
    }

}
