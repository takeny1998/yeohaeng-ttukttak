package com.yeohaeng_ttukttak.server.doc.travel;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelPlanCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelPlanResponse;
import com.yeohaeng_ttukttak.server.common.dto.VoidResponse;
import com.yeohaeng_ttukttak.server.doc.Throws;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL;


@Tag(name = "일정", description = "여행 일정과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelPlanDocument {

    String REQUIRE_CREATE_OR_JOIN =  "[새 여행 생성](#/여행/create)하거나 기존 여행에 참여한 상태여야 합니다.";

    @Operation(
        summary = "일정 생성 API",
        description = REQUIRE_CREATE_OR_JOIN)
    @ApiResponse(
        responseCode = "200",
        useReturnTypeSchema = true,
        description = """
        생성된 일정 객체를 반환합니다.
        
        - 추가된 일정은 일차(willVisitOn)가 같은 일정 목록의 마지막 순서(orderOfPlan)가 부여됩니다.
         
        """)
    @Throws(DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL)
    TravelPlanResponse create(TravelPlanCreateRequest request);



}
