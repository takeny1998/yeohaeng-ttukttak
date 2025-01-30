package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentEditRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentWriteRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelPlanService;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.TravelPlanCommentService;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanCommentListResponse;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.doc.travel.TravelPlanDocument;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v2/plans")
@RequiredArgsConstructor
public class TravelPlanController implements TravelPlanDocument {

    private final TravelPlanService travelPlanService;
    private final TravelPlanCommentService travelPlanCommentService;
    
    @PostMapping
    @Authentication
    public TravelPlanResponse create(
            @RequestBody TravelPlanCreateRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        final Long planId = travelPlanService.create(
                request.travelId(),
                request.placeId(),
                memberId,
                request.willVisitOn());

        return new TravelPlanResponse(travelPlanService.findById(planId));
    }

    @PostMapping("/{planId}/comments")
    @Authentication
    public TravelPlanCommentListResponse writeComment(
            @PathVariable Long planId,
            @RequestBody @Valid TravelPlanCommentWriteRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        travelPlanCommentService.write(planId, memberId, request.content());

        return toCommentListResponse(planId);
    }


    @GetMapping("/{planId}/comments")
    public TravelPlanCommentListResponse findAllComments(
            @PathVariable Long planId) {

        return toCommentListResponse(planId);
    }

    @PatchMapping("/{planId}/comments/{commentId}")
    @Authentication
    public TravelPlanCommentListResponse editComment(
            @PathVariable Long planId,
            @PathVariable Long commentId,
            @RequestBody @Valid TravelPlanCommentEditRequest request) {

        final String memberId = AuthenticationContextHolder
                .getContext().uuid();

        final String content = request.content();

        travelPlanCommentService.edit(planId, commentId, memberId, content);

        return toCommentListResponse(planId);
    }


    @DeleteMapping("/{planId}/comments/{commentId}")
    @Authentication
    public TravelPlanCommentListResponse deleteComment(
            @PathVariable Long planId,
            @PathVariable Long commentId) {

        final String memberId = AuthenticationContextHolder.getContext().uuid();

        travelPlanCommentService.delete(planId, commentId, memberId);

        return toCommentListResponse(planId);
    }

    private TravelPlanCommentListResponse toCommentListResponse(final Long planId) {

        return new TravelPlanCommentListResponse(
                travelPlanCommentService.findAll(planId));
    }

}
