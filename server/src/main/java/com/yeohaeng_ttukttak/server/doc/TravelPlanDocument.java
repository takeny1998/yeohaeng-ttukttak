package com.yeohaeng_ttukttak.server.doc;

import com.yeohaeng_ttukttak.server.application.travel_plan.dto.CreateTravelPlanRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.MoveTravelPlanRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.doc.annotation.ApiExceptionResponse;
import com.yeohaeng_ttukttak.server.doc.annotation.ApiPostCondition;
import com.yeohaeng_ttukttak.server.domain.travel.exception.InvalidTravelCitySizeFailException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;


@Tag(name = "여행 일정(Travel Plan)", description = "여행 일정과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelPlanDocument {

    @Operation(summary = "지정한 여행에 새로운 여행 일정을 추가합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = """
            생성된 항목을 포함한 최신 상태의 일정 목록을 반환합니다.
            
            - 추가된 일정은 일차(willVisitOn)가 같은 일정 목록의 마지막 순서(orderOfPlan)가 부여됩니다.
            
            - 일정 목록은 일차(willVisitOn) 오름차순, 순서(orderOfPlan) 오름차순 기준으로 정렬되어야 합니다.
            
            """)
    TravelPlanListResponse create(
            Long travelId, CreateTravelPlanRequest request);


    @ApiResponse(
                responseCode = "200",
                description = """
                조회된 일정 목록을 반환합니다.
                
                - 일정 목록은 일차(willVisitOn) 오름차순, 순서(orderOfPlan) 오름차순 기준으로 정렬되어야 합니다.
                
                """, useReturnTypeSchema = true)
    @Operation(summary = "지정한 여행의 계획 목록을 조회합니다.")
    TravelPlanListResponse findAll(Long travelId);

    @Operation(summary = "지정한 여행 일정의 일차(willVisitOn)와 순서(orderOfPlan)를 변경합니다.")
    @ApiResponse(
            responseCode = "200",
            description = """
                변경된 일정을 포함한 최신 상태의 일정 목록을 반환합니다.
                
                - 일자(willVisitOn)가 같고, 순서(orderOfPlan)가 같거나 큰 일정의 순서(orderOfPlan)을 뒤로 밉니다.
                
                - 일정 목록은 일차(willVisitOn) 오름차순, 순서(orderOfPlan) 오름차순 기준으로 정렬되어야 합니다.
                
                """, useReturnTypeSchema = true)
    TravelPlanListResponse move(
            Long travelId, Long planId, MoveTravelPlanRequest request);


    @Operation(summary = "지정한 여행 일정을 계획 목록에서 삭제합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = """
            삭제된 항목을 반영한 최신 상태의 일정 목록을 반환합니다.
            
            - 추가된 일정은 일차(willVisitOn)가 같은 일정 목록의 마지막 순서(orderOfPlan)가 부여됩니다.
                        
            """)
    TravelPlanListResponse delete(Long travelId, Long planId);

}
