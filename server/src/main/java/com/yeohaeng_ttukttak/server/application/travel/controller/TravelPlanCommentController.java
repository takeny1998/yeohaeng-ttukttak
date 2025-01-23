package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentEditRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan_comment.TravelPlanCommentService;
import com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto.TravelPlanCommentListResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCommentWriteRequest;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.authentication.AuthenticationContextHolder;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.doc.travel.TravelPlanCommentDocument;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanCommentDto;
import com.yeohaeng_ttukttak.server.domain.comment.CommentRoleService;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelRoleService;
import jakarta.annotation.Nonnull;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v2/travels/{travelId}/plans/{planId}/comments")
@RequiredArgsConstructor
public class TravelPlanCommentController implements TravelPlanCommentDocument {

    private final TravelPlanCommentService travelPlanCommentService;

    private final TravelRoleService travelRoleService;

    private final CommentRoleService commentRoleService;


    @PostMapping
    @Authentication
    public TravelPlanCommentListResponse write(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @RequestBody @Valid TravelPlanCommentWriteRequest request) {

        final String memberId =
                AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(travelRoleService.creator(travelId))
                .or(travelRoleService.participant(travelId))
                .authorize();

        travelPlanCommentService.write(travelId, planId, request.content());

        return toListResponse(travelId, planId);
    }


    @GetMapping
    public TravelPlanCommentListResponse findAll(
            @PathVariable Long travelId,
            @PathVariable Long planId) {

        return toListResponse(travelId, planId);
    }


    @PatchMapping("/{commentId}")
    @Authentication
    public TravelPlanCommentListResponse edit(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @PathVariable Long commentId,
            @RequestBody @Valid TravelPlanCommentEditRequest request) {

        final String memberId = AuthenticationContextHolder
                .getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(commentRoleService.writer(commentId))
                .authorize();

        final String content = request.content();

        travelPlanCommentService.edit(travelId, planId, commentId, content);

        return toListResponse(travelId, planId);
    }

    @DeleteMapping("/{commentId}")
    @Authentication
    public TravelPlanCommentListResponse delete(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @PathVariable Long commentId) {

        final String memberId = AuthenticationContextHolder.getContext().uuid();

        new AuthorizationBuilder(memberId)
                .or(travelRoleService.creator(travelId))
                .or(commentRoleService.writer(commentId))
                .authorize();

        travelPlanCommentService.delete(travelId, planId, commentId);

        return toListResponse(travelId, planId);
    }

    @Nonnull
    private TravelPlanCommentListResponse toListResponse(Long travelId, Long planId) {
        final List<TravelPlanCommentDto> dtoList = travelPlanCommentService.findAll(travelId, planId);

        return new TravelPlanCommentListResponse(dtoList);
    }

}
