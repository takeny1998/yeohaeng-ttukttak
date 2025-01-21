package com.yeohaeng_ttukttak.server.application.member.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.member.dto.MemberDto;

public final class MemberResponse extends ServerSuccessResponse<MemberResponse.Data> {

    public MemberResponse(MemberDto member) {
        super(new Data(member));
    }

    public record Data(MemberDto member) { }

}
