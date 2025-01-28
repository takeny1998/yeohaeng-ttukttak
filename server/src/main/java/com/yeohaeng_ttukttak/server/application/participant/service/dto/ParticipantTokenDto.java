package com.yeohaeng_ttukttak.server.application.participant.service.dto;

import io.swagger.v3.oas.annotations.media.Schema;

public record ParticipantTokenDto(

        @Schema(title = "참여 토큰",
                description = "암호화된 참여 토큰의 값 입니다.",
                example = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c")
        String participantToken,

        @Schema(title = "유효 시간", description = "초 단위의 유효 시간입니다.", example = "300")
        long expiresIn
) { }
