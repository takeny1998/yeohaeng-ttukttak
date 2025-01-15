package com.yeohaeng_ttukttak.server.application.travel.doc;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelResponse;
import com.yeohaeng_ttukttak.server.common.docs.ApiExceptionResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.travel.exception.*;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "여행 (Travel)", description = "사용자 여행과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelDocument {

    @ApiExceptionResponse({
            InvalidTravelCompanionSizeFailException.class,
            InvalidTravelMotivationSizeFailException.class,
            InvalidTravelCitySizeFailException.class,
            TravelNameTooLongFailException.class,
            InvalidTravelNameCharacterFailException.class,
            InvalidTravelDateFormatFailException.class,
            TravelPeriodTooLongFailException.class
    })
    ServerResponse<TravelResponse> create(TravelRequest request);


    @ApiExceptionResponse({
            InvalidTravelCompanionSizeFailException.class,
            InvalidTravelMotivationSizeFailException.class,
            TravelNameTooLongFailException.class,
            InvalidTravelNameCharacterFailException.class,
            InvalidTravelDateFormatFailException.class,
            TravelPeriodTooLongFailException.class
    })
    ServerResponse<TravelResponse> update(Long travelId, TravelRequest request);

}
