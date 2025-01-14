package com.yeohaeng_ttukttak.server.application.travel.doc;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.CreateTravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelResponse;
import com.yeohaeng_ttukttak.server.common.docs.ApiExceptionResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.travel.exception.InvalidTravelCompanionSizeFailException;
import com.yeohaeng_ttukttak.server.domain.travel.exception.InvalidTravelMotivationSizeFailException;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "여행 (Travel)", description = "사용자 여행과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelDocument {

    @ApiExceptionResponse({
            InvalidTravelCompanionSizeFailException.class,
            InvalidTravelMotivationSizeFailException.class,
    })
    ServerResponse<TravelResponse> create(CreateTravelRequest request);

}
