package com.yeohaeng_ttukttak.server.application.plan;

import com.yeohaeng_ttukttak.server.application.plan.dto.CommentListResponse;
import com.yeohaeng_ttukttak.server.application.plan.dto.WriteCommentRequest;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanCommentDto;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/v2/plans/{planId}/comments")
@RequiredArgsConstructor
public class TravelPlanCommentController {

    private final TravelPlanService travelPlanService;

    @PostMapping
    @Authorization
    public ServerResponse<CommentListResponse> writeComment(
            @PathVariable Long planId,
            @RequestBody @Valid WriteCommentRequest request,
            AuthenticationContext authentication) {

        travelPlanService.writeComment(
                planId,
                authentication.uuid(),
                request.content());

        final List<TravelPlanCommentDto> comments =
                travelPlanService.getOrderedComments(planId);

        return new ServerResponse<>(new CommentListResponse(comments));
    }

}
