package com.yeohaeng_ttukttak.server.doc.travel;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelParticipantCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.request.TravelParticipantTokenCreateRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelParticipantTokenResponse;
import com.yeohaeng_ttukttak.server.doc.Throws;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.*;

@Tag(name = "여행 참여", description = "[여행](#/여행) 초대 및 참여를 위한 API 컬렉션 입니다.")
public interface TravelParticipantDocument {

    @Operation(
            summary = "지정된 여행에 참여할 수 있는 초대 토큰을 생성합니다.",
            description = """
                    해당 작업을 수행하기 위해, 다음 조건 중 하나 이상 만족해야 합니다.
                    - [여행 생성](#/여행/create): 지정한 여행을 생성한 사용자여야 합니다.
                    - [여행 참여](#/여행%20참여/join): 지정한 여행에 참여한 사용자여야 합니다.""")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = """
                    생성된 초대 토큰과 유효 시간 정보를 반환합니다.
                    - 유효 시간은 초 단위의 정수 값입니다.""")
    @Throws(TOO_MANY_PARTICIPANT_FAIL)
    TravelParticipantTokenResponse createToken(TravelParticipantTokenCreateRequest request);


    @Operation(summary = "초대 토큰을 사용해 지정된 여행에 참여합니다.")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = "참여한 여행 정보를 반환합니다.")
    @Throws({INVITATION_INVALID_OR_EXPIRED_FAIL,
            TRAVEL_ALREADY_JOINED_FAIL,
            TOO_MANY_PARTICIPANT_FAIL})
    TravelParticipantResponse updateByToken(TravelParticipantCreateRequest request);


}
