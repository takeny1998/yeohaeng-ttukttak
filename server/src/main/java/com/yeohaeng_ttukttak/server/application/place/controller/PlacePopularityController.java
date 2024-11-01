package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.PlaceRecommendationResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlacePopularityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v2/places/popularity")
@RequiredArgsConstructor
public class PlacePopularityController {

    private final GeographyRepository geographyRepository;
    private final PlacePopularityRepository repository;

    @GetMapping
    public ServerResponse<PlaceRecommendationResponse> byVisit(
            @RequestParam Long cityId,
            @RequestParam PlaceCategoryType category,
            @RequestParam int pageSize,
            @RequestParam int pageNumber
    ) {

        Geography geography = geographyRepository.findById(cityId)
                .orElseThrow(EntityNotFoundException::new);

        PageResult<Place> result = repository.byVisit(
                category,
                geography.codeStart(),
                geography.codeEnd(),
                new PageCommand(pageSize, pageNumber));

        return new ServerResponse<>(new PlaceRecommendationResponse(
                result.data().stream()
                        .map(PlaceDto::of)
                        .toList(),
                result.hasNextPage()
        ));

    }

}
