package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.yeohaeng_ttukttak.server.application.travel_city_attraction.dto.AttractionInfiniteScrolledResponse;
import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollCommand;
import com.yeohaeng_ttukttak.server.common.dto.InfiniteScrollResult;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_city_attraction.AttractionDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@JsonRequestMapping("/api/v2/travels/{travelId}/cities/{cityId}/attractions")
@RequiredArgsConstructor
public class TravelCityAttractionController {

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;
    private final TravelCityAttractionRepository repository;

    @GetMapping
    @Transactional(readOnly = true)
    public ServerResponse<AttractionInfiniteScrolledResponse> orderByTravelSimilarity(
            @PathVariable Long travelId, @PathVariable Long cityId, @ModelAttribute InfiniteScrollCommand scrollCommand) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final City city = geographyRepository.findCityById(cityId)
                .orElseThrow(() -> new EntityNotFoundFailException(City.class));

        final InfiniteScrollResult<AttractionDto> scrollResult =
                repository.orderByTravelSimilarity(scrollCommand, travel, city);

        return new ServerResponse<>(new AttractionInfiniteScrolledResponse(scrollResult));
    }

}
