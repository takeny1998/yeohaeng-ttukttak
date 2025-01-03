package com.yeohaeng_ttukttak.server.application.travel_city;

import com.yeohaeng_ttukttak.server.application.travel.service.TravelService;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelAndCityListDto;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/cities")
@RequiredArgsConstructor
public class TravelCityController {

    private final TravelService travelService;
    private final TravelCityService travelCityService;

    @PostMapping("/{cityId}")
    @Authorization
    public ServerResponse<TravelAndCityListDto> addCity(
            @PathVariable Long travelId,
            @PathVariable Long cityId,
            AuthenticationContext context,
            Locale locale) {

        travelCityService.addCity(locale, context.uuid(), travelId, cityId);

        final List<GeographyDto> cityDtoList = travelCityService.findCities(travelId);

        final TravelDto travelDto = travelService.findById(travelId);


        return new ServerResponse<>(new TravelAndCityListDto(travelDto, cityDtoList));
    }

}
