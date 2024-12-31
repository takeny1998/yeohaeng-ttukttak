package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.yeohaeng_ttukttak.server.application.travel_city_attraction.dto.PlaceInfiniteScrolledResponse;
import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollCommand;
import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollResult;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/v2/travels/{travelId}/cities/{cityId}/attractions")
@RequiredArgsConstructor
public class TravelCityAttractionController {

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;
    private final TravelCityAttractionRepository repository;

    @GetMapping
    @Transactional(readOnly = true)
    public ServerResponse<PlaceInfiniteScrolledResponse> orderByTravelSimilarity(
            @PathVariable Long travelId, @PathVariable Long cityId, @ModelAttribute InfiniteScrollCommand scrollCommand) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final City city = geographyRepository.findCityById(cityId)
                .orElseThrow(() -> new EntityNotFoundFailException(City.class));

        final InfiniteScrollResult<PlaceDto> scrollResult =
                repository.orderByTravelSimilarity(scrollCommand, travel, city);

        return new ServerResponse<>(new PlaceInfiniteScrolledResponse(scrollResult));
    }

}
