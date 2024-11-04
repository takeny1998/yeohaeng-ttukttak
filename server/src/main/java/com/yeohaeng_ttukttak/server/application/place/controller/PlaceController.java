package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.FindPlacesByCategoryResponse;
import com.yeohaeng_ttukttak.server.common.util.dto.PageCommand;
import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceMetricsDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceSortType;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Transactional(readOnly = true)
@RestController
@RequestMapping("/api/v2/places")
@RequiredArgsConstructor
public class PlaceController {

    private final GeographyRepository geographyRepository;
    private final PlaceCategoryRepository placeCategoryRepository;

    @GetMapping
    public ServerResponse<FindPlacesByCategoryResponse> findByCategory(
            @RequestParam Long cityId,
            @RequestParam PlaceCategoryType category,
            @RequestParam PlaceSortType sortType,
            PageCommand pageCommand) {

        final City city = geographyRepository.findCityById(cityId)
                .orElseThrow(EntityNotFoundException::new);

        PageResult<PlaceMetricsDto> pageResult = placeCategoryRepository.call(
                category, city.codeStart(), city.codeEnd(),
                sortType, pageCommand);

        return new ServerResponse<>(FindPlacesByCategoryResponse.of(pageResult));
    }

}
