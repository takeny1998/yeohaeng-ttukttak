package com.yeohaeng_ttukttak.server.application.geography.controller;

import com.yeohaeng_ttukttak.server.application.geography.controller.dto.FindAllGeographyResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.CityDto;
import com.yeohaeng_ttukttak.server.domain.geography.dto.RegionDto;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("/api/v2/geographies")
@RequiredArgsConstructor
public class GeographyController {

    private final GeographyRepository geographyRepository;

    @GetMapping
    @Transactional(readOnly = true)
    public ServerResponse<FindAllGeographyResponse> findAll() {

        List<RegionDto> regions = geographyRepository.findAllRegion()
                .stream()
                .map(RegionDto::of)
                .toList();

        List<CityDto> cities = geographyRepository.findAllCity()
                .stream()
                .map((CityDto::of))
                .toList();

        return new ServerResponse<>(
                new FindAllGeographyResponse(regions, cities));
    }

}
