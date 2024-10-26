package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.PlaceRecommendationResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidArgumentException;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
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
            @RequestParam int pageSize,
            @RequestParam int pageNumber,
            @RequestParam(required = false) Motivation motivation,
            @RequestParam(required = false) CompanionType companionType) {

        if (Objects.nonNull(motivation) && Objects.nonNull(companionType)) {
            throw new InvalidArgumentException();
        }

        PageCommand pageCommand = new PageCommand(pageSize, pageNumber);


        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(EntityNotFoundException::new);

        if (Objects.nonNull(motivation)) {
            PageResult<Place> places = placeRecommendationsRepository.byMotivationOrderByRatio(
                    category, geography.codeStart(), geography.codeEnd(), motivation, pageCommand);

            return toResponse(places);
        }

        PageResult<Place> pagedResult = placeRecommendationsRepository.byCompanionTypeOrderByRatio(
                        category, geography.codeStart(), geography.codeEnd(), companionType, pageCommand);

        return toResponse(pagedResult);
    }

    private ServerResponse<PlaceRecommendationResponse> toResponse(PageResult<Place> result) {
        return new ServerResponse<>(new PlaceRecommendationResponse(
                result.data().stream()
                        .map(PlaceDto::of)
                        .toList(),
                result.hasNextPage()
        ));
    }

}
