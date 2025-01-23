package com.yeohaeng_ttukttak.server.doc;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanMoveRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanListResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL;
import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL;


@Tag(name = "여행 일정", description = "여행 일정과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelPlanDocument {

    String REQUIRE_CREATE_OR_JOIN =  "[새 여행 생성](#/여행/create)하거나 기존 여행에 참여한 상태여야 합니다.";

    @Operation(
        summary = "지정한 여행에 새로운 여행 일정을 추가합니다.",
        description = REQUIRE_CREATE_OR_JOIN)
    @ApiResponse(
        responseCode = "200",
        useReturnTypeSchema = true,
        description = """
        생성된 항목을 포함한 최신 상태의 일정 목록을 반환합니다.
        
        - 추가된 일정은 일차(willVisitOn)가 같은 일정 목록의 마지막 순서(orderOfPlan)가 부여됩니다.
        
        - 일정 목록은 일차(willVisitOn) 오름차순, 순서(orderOfPlan) 오름차순 기준으로 정렬되어야 합니다.
        
        """)
    @Throws(DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL)
    TravelPlanListResponse create(
            Long travelId, TravelPlanCreateRequest request);


    @Operation(
        summary = "지정한 여행의 계획 목록을 조회합니다.",
        description = REQUIRE_CREATE_OR_JOIN)
    @ApiResponse(
        responseCode = "200",
        useReturnTypeSchema = true,
        description = """
        조회된 일정 목록을 반환합니다.
        
        - 일정 목록은 일차(willVisitOn) 오름차순, 순서(orderOfPlan) 오름차순 기준으로 정렬되어야 합니다.
        
        """)
    TravelPlanListResponse findAll(Long travelId);


    @Operation(
        summary = "지정한 여행 일정의 일차(willVisitOn)와 순서(orderOfPlan)를 변경합니다.",
        description = REQUIRE_CREATE_OR_JOIN)
    @ApiResponse(
        responseCode = "200",
        useReturnTypeSchema = true,
        description = """
            변경된 일정을 포함한 최신 상태의 일정 목록을 반환합니다.
            
            - 일자(willVisitOn)가 같고, 순서(orderOfPlan)가 같거나 큰 일정의 순서(orderOfPlan)을 뒤로 밉니다.
            
            - 일정 목록은 일차(willVisitOn) 오름차순, 순서(orderOfPlan) 오름차순 기준으로 정렬되어야 합니다.
            
            """)
    @Throws(WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL)
    TravelPlanListResponse move(
            Long travelId, Long planId, TravelPlanMoveRequest request);


    @Operation(
        summary = "지정한 여행 일정을 계획 목록에서 삭제합니다.",
        description = REQUIRE_CREATE_OR_JOIN)
    @ApiResponse(
        responseCode = "200",
        useReturnTypeSchema = true,
        description = """
        삭제된 항목을 반영한 최신 상태의 일정 목록을 반환합니다.
        
        - 추가된 일정은 일차(willVisitOn)가 같은 일정 목록의 마지막 순서(orderOfPlan)가 부여됩니다.
                    
        """)
    TravelPlanListResponse delete(Long travelId, Long planId);

}
