package com.yeohaeng_ttukttak.server.doc.travel;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.response.TravelInvitationResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "여행 초대")
public interface TravelInvitationDocument {

    @Operation(
            summary = "지정한 여행에 다른 사용자를 초대할 수 있는 토큰을 생성합니다.",
            description = """
                    해당 작업을 수행하기 위해 다음 조건을 만족해야 합니다.
                    - [여행 생성](#/여행/create): 지정한 여행을 생성한 사용자여야 합니다.
                    - [여행 참여](#/여행%20참여/join): 지정한 여행에 참여한 사용자여야 합니다.
                    
                    다음과 같은 반환 값이 다른 작업에서 사용됩니다.
                    - [여행 참여](#/여행%20참여/join): 초대 토큰을 입력 값으로 사용합니다.""")
    @ApiResponse(
            responseCode = "200",
            useReturnTypeSchema = true,
            description = """
                    생성된 초대 토큰을 반환합니다.
                    - 해당 토큰은 최대 300초(5분)간 유효합니다.""")
    TravelInvitationResponse create(
            @Parameter(
                    required = true,
                    description = "초대할 여행의 식별자; 올바른 식별자를 제공해야 합니다.")
            Long travelId
    );

}
