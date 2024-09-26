package com.yeohaeng_ttukttak.server.domain.region.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.region.entity.Region;

import java.util.List;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
public record RegionDto(
        Long id,
        String name,
        List<RegionDto> children
) {

    public static RegionDto of(Region region) {
        return new RegionDto(
                region.id(),
                region.name(),
                region.children().stream()
                        .map(RegionDto::of).toList()
        );
    }

}
