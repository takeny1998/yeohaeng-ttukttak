package com.yeohaeng_ttukttak.server.application.travel.controller;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelRequest;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelResponse;
import com.yeohaeng_ttukttak.server.domain.auth.dto.AuthenticationContext;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "여행 (Travel)", description = "사용자 여행과 관련된 API Collecion 입니다.")
public interface TravelDocument {

    @Operation(description = "새로운 사용자 여행을 생성합니다.")
    ServerResponse<CreateTravelResponse> create(CreateTravelRequest request, AuthenticationContext context);

}
