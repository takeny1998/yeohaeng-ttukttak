package com.yeohaeng_ttukttak.server.application.geography.controller;

import com.yeohaeng_ttukttak.server.application.geography.controller.dto.GeographyListResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v2/geographies")
@RequiredArgsConstructor
public class GeographyController {

    private final GeographyRepository geographyRepository;

    @GetMapping
    @Transactional(readOnly = true)
    public ServerResponse<GeographyListResponse> findAll() {

       final List<GeographyDto> dtoList =
               geographyRepository.findAll()
                       .stream()
                       .map(GeographyDto::of)
                       .toList();

        return new ServerResponse<>(new GeographyListResponse(dtoList));

    }

}
