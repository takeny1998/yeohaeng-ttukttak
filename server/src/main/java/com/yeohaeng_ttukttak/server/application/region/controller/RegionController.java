package com.yeohaeng_ttukttak.server.application.region.controller;

import com.yeohaeng_ttukttak.server.application.region.controller.dto.FindAllRegionResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.region.dto.CityDto;
import com.yeohaeng_ttukttak.server.domain.region.dto.RegionDto;
import com.yeohaeng_ttukttak.server.domain.region.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.region.repository.RegionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("/api/v2/regions")
@RequiredArgsConstructor
public class RegionController {

    private final RegionRepository regionRepository;

    @Transactional(readOnly = true)
    @GetMapping
    public ServerResponse<FindAllRegionResponse> findAll(Locale locale) {

        List<RegionDto> regions = regionRepository.findAllRegion()
                .stream()
                .map((region) -> RegionDto.of(region, locale))
                .toList();

        List<CityDto> cities = regionRepository.findAllCity()
                .stream()
                .map((city -> CityDto.of(city, locale)))
                .toList();

        return new ServerResponse<>(
                new FindAllRegionResponse(regions, cities));
    }

}
