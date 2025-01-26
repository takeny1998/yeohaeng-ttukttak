package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanCommentDto;

import java.util.List;

public final class TravelPlanCommentListResponse extends ServerSuccessResponse<TravelPlanCommentListResponse.CommentListData> {

    public TravelPlanCommentListResponse(List<TravelPlanCommentDto> comments) {
        super(new CommentListData(comments));
    }

    public record CommentListData(List<TravelPlanCommentDto> comments) { }
}
