package com.yeohaeng_ttukttak.server.application.region.controller;

import com.yeohaeng_ttukttak.server.application.region.controller.dto.FindAllRegionResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.region.dto.RegionDto;
import com.yeohaeng_ttukttak.server.domain.region.entity.Region;
import com.yeohaeng_ttukttak.server.domain.region.repository.RegionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
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
    private final MessageSource regionSource;

    private RegionDto convert(Region region, Locale locale) {
        String key = "name.%d".formatted(region.id());
        final String name = regionSource.getMessage(key, null, locale);

        return new RegionDto(
                region.id(), name,
                region.children().stream()
                        .map((child) -> this.convert(child, locale))
                        .toList()
        );
    }


    @Transactional(readOnly = true)
    @GetMapping
    public ServerResponse<FindAllRegionResponse> findAll(Locale locale) {

        List<RegionDto> regions = regionRepository.findAllState().stream()
                .map((region) -> this.convert(region, locale))
                .toList();

        return new ServerResponse<>(
                new FindAllRegionResponse(regions));
    }

}
