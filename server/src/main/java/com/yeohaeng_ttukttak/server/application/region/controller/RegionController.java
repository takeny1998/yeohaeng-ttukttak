package com.yeohaeng_ttukttak.server.application.region.controller;

import com.yeohaeng_ttukttak.server.application.region.controller.dto.FindAllRegionResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.region.dto.RegionDto;
import com.yeohaeng_ttukttak.server.domain.region.repository.RegionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v2/regions")
@RequiredArgsConstructor
public class RegionController {

    private final RegionRepository regionRepository;

    @Transactional(readOnly = true)
    @GetMapping
    public ServerResponse<FindAllRegionResponse> findAll() {
        List<RegionDto> regions = regionRepository.findAllState().stream()
                .map(RegionDto::of)
                .toList();

        return new ServerResponse<>(
                new FindAllRegionResponse(regions));
    }

}
