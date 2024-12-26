package com.yeohaeng_ttukttak.server.application.travel_city;

import com.yeohaeng_ttukttak.server.application.travel_city.dto.CityListResponse;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/cities")
@RequiredArgsConstructor
public class TravelCityController {

    private final TravelCityService travelCityService;

    @PostMapping("/{cityId}")
    @Authorization
    public ServerResponse<CityListResponse> addCity(
            @PathVariable Long travelId,
            @PathVariable Long cityId,
            AuthenticationContext context) {

        travelCityService.addCity(
                context.uuid(), travelId, cityId);

        final List<GeographyDto> dtoList = travelCityService.findCities(travelId);

        return new ServerResponse<>(new CityListResponse(dtoList));
    }

}
