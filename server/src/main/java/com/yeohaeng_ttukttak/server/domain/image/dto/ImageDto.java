package com.yeohaeng_ttukttak.server.domain.image.dto;

import com.yeohaeng_ttukttak.server.domain.image.entity.Image;

public record ImageDto(
        Long id, String path, String name, String ext, Long targetId) {

    public static ImageDto of(Image image) {
        return new ImageDto(
                image.id(), image.path(), image.name(), image.ext(), image.targetId());
    }

}
