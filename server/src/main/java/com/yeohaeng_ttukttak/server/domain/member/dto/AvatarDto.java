package com.yeohaeng_ttukttak.server.domain.member.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.Avatar;

public record AvatarDto(
        String host,
        String path,
        String ext
) { 
    
    public static AvatarDto of(String host, Avatar avatar) {
        return new AvatarDto(host, avatar.path(), avatar.ext());
    }
    
}
