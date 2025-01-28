package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import io.swagger.v3.oas.annotations.media.Schema;

public record TravelInvitationDto(
        @Schema(title = "초대 토큰",
                description = "300초(5분)간 유효한 초대 토큰입니다.",
                example = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c")
        String token
) {

    public static TravelInvitationDto of(final TravelInvitation invitation) {
        return new TravelInvitationDto(invitation.id());
    }

}
