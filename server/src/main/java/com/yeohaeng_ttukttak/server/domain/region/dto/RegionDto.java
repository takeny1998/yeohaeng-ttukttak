package com.yeohaeng_ttukttak.server.domain.region.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.region.entity.Region;
import jakarta.annotation.PostConstruct;
import org.springframework.context.MessageSource;

import java.util.List;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public record RegionDto(
        Long id,
        String name,
        List<RegionDto> children
) { }
