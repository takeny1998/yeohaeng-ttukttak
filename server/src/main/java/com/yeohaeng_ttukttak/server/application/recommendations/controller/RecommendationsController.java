package com.yeohaeng_ttukttak.server.application.recommendations.controller;

import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRecommendationRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Motivation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v2/recommendations")
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RecommendationsController {

    private final GeographyRepository geographyRepository;
    private final PlaceRecommendationRepository placeRecommendRepository;

    @GetMapping("/places/{category}/motivation/{motivation}")
    public ServerResponse<List<PlaceDto>> recommendByMotivation(
            @PathVariable PlaceCategory category,
            @RequestParam("cityId") Long cityId,
            @PathVariable("motivation") Motivation motivation) {

        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(EntityNotFoundException::new);

        List<Place> places = placeRecommendRepository.recommendByMotivation(
                category, geography.codeStart(), geography.codeEnd(), motivation);

        return new ServerResponse<>(places.stream()
                .map(PlaceDto::of)
                .toList());
    }

    @GetMapping("/places/{category}/companionType/{companionType}")
    public ServerResponse<List<PlaceDto>> recommendByCompanionType(
            @PathVariable PlaceCategory category,
            @RequestParam("cityId") Long cityId,
            @PathVariable("companionType") CompanionType companionType) {

        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(EntityNotFoundException::new);

        List<Place> places = placeRecommendRepository.recommendByCompanionType(
                category, geography.codeStart(), geography.codeEnd(), companionType);

        return new ServerResponse<>(places.stream()
                .map(PlaceDto::of)
                .toList());
    }
}
