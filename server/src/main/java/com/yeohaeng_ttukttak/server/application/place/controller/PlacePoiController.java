package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.FindPlacePoisResponse;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceMetricRecord;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceSortType;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlacePoiRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Transactional(readOnly = true)
@RestController
@RequestMapping("/api/v2/places/pois")
@RequiredArgsConstructor
public class PlacePoiController {

    private final GeographyRepository geographyRepository;
    private final PlacePoiRepository poiRepository;

    @GetMapping
    public ServerResponse<FindPlacePoisResponse> findois(
            @RequestParam Long cityId,
            @RequestParam PlaceSortType sortType,
            PageCommand pageCommand) {

        final City city = geographyRepository.findCityById(cityId)
                .orElseThrow(() -> new EntityNotFoundFailException(City.class));

        PageResult<PlaceMetricRecord> pageResult = poiRepository.call(
                city.codeStart(), city.codeEnd(), sortType, pageCommand);

        return new ServerResponse<>(
                FindPlacePoisResponse.of(pageResult));
    }

}
