package com.yeohaeng_ttukttak.server.application.recommendations.controller;

import com.yeohaeng_ttukttak.server.application.recommendations.controller.dto.RecommendPlacesRequest;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategory;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRecommendationRepository;
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

    @GetMapping("/places/{category}")
    public ServerResponse<List<PlaceDto>> recommend(
            @PathVariable PlaceCategory category,
            @ModelAttribute RecommendPlacesRequest request) {

        City city = geographyRepository.findCityById(request.cityId())
                .orElseThrow(EntityNotFoundException::new);

        List<Place> places = placeRecommendRepository.find(
                category,
                city.codeStart(), city.codeEnd(),
                request.motivation(),
                request.companion());

        return new ServerResponse<>(places.stream().map(PlaceDto::of).toList());
    }

}
