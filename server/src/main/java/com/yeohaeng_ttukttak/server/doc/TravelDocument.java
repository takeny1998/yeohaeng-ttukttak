package com.yeohaeng_ttukttak.server.doc;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelUpdateRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.*;

@Tag(name = "여행", description = "사용자 여행과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelDocument {

    String REQUIRE_CREATE_OR_JOIN =  "[새 여행 생성](#/여행/create)하거나 기존 여행에 참여한 상태여야 합니다.";

    String MUST_GENERATE_IF_NAME_IS_NULL = """
            - name이 null인 경우, 다음과 같은 규칙으로 자동 생성됩니다.
            
                - 지정한 cityIds의 상위 지역(Province) 이름으로 구성됩니다.
                
                   - 서울시 중구, 경기도 수원시를 고른 경우, "서울, 경기 여행" 이름이 생성됩니다.
                   
                   - 충청북도 청주시, 증평군을 고른 경우, "충북 여행" 이름이 생성됩니다.
                
                - 지정한 언어에 따라 한국어 또는 영어로 번역됩니다.
                
                   - 현재 요청이 영문 로케일일 경우, "Travel to Seoul, Gyeonggi" 이름이 생성됩니다.
            """;

    @Operation(summary = "새로운 여행을 생성합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "생성된 여행 객체를 반환합니다.\n" + MUST_GENERATE_IF_NAME_IS_NULL)
    @Throws({
            INVALID_TRAVEL_NAME_CHARACTER_FAIL,
            TRAVEL_NAME_TOO_LONG_FAIL,

            STARTED_ON_AFTER_ENDED_ON_FAIL,
            TRAVEL_PERIOD_TOO_LONG_FAIL,

            TRAVEL_COMPANION_TYPE_COUNT_OUT_OF_RANGE_FAIL,
            TRAVEL_MOTIVATION_TYPE_COUNT_OUT_OF_RANGE_FAIL,

            TRAVEL_CITY_COUNT_EXCEEDED_FAIL
    })
    TravelResponse create(TravelCreateRequest request);

    @Operation(summary = "여행의 기본 정보를 조회합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "조회된 여행 객체를 반환합니다.")
    TravelResponse find(Long travelId);

    @Operation(summary = "여행의 기본 정보를 변경합니다.", description = REQUIRE_CREATE_OR_JOIN)

    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "변경된 여행 객체를 반환합니다.\n" + MUST_GENERATE_IF_NAME_IS_NULL)
    @Throws({
            INVALID_TRAVEL_NAME_CHARACTER_FAIL,
            TRAVEL_NAME_TOO_LONG_FAIL,

            STARTED_ON_AFTER_ENDED_ON_FAIL,
            TRAVEL_PERIOD_TOO_LONG_FAIL,

            TRAVEL_COMPANION_TYPE_COUNT_OUT_OF_RANGE_FAIL,
            TRAVEL_MOTIVATION_TYPE_COUNT_OUT_OF_RANGE_FAIL,

            TRAVEL_CITY_COUNT_EXCEEDED_FAIL
    })
    TravelResponse update(Long travelId, TravelUpdateRequest request);

}
