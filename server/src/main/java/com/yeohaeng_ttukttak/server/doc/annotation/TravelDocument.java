package com.yeohaeng_ttukttak.server.doc.annotation;

import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelRequest;
import com.yeohaeng_ttukttak.server.application.travel.controller.dto.TravelResponse;
import com.yeohaeng_ttukttak.server.doc.annotation.ApiExceptionResponse;
import com.yeohaeng_ttukttak.server.doc.annotation.ApiPostCondition;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.travel.exception.*;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "여행 (Travel)", description = "사용자 여행과 관련된 동작을 수행하는 컬렉션 입니다.")
public interface TravelDocument {

    String MUST_GENERATE_NAME_IF_NULL = """
        여행 이름(name)을 지정하지 않은 경우, 다음과 같이 자동 생성됩니다.
        
            - 선택한 도시(City)의 상위 지역(Province) 이름으로 구성됩니다.
              
                - 서울시 중구, 도봉구: 서울 여행
                
                - 서울시 중구, 경기도 수원시: 서울, 경기 여행
                
            - 지역(Province) 이름은 요청 언어에 따라 한국어 또는 영어로 표시됩니다.
            
                - 영어: Travel to seoul
        """;

    String MUST_RETURN_NEW_STATE =
            "반드시 작업 이후의 최신 여행(Travel) 객체를 반환해야 합니다.";

    @ApiExceptionResponse({
            InvalidTravelCompanionSizeFailException.class,
            InvalidTravelMotivationSizeFailException.class,
            InvalidTravelCitySizeFailException.class,
            TravelNameTooLongFailException.class,
            InvalidTravelNameCharacterFailException.class,
            InvalidTravelDateFormatFailException.class,
            TravelPeriodTooLongFailException.class
    })
    @ApiPostCondition(MUST_GENERATE_NAME_IF_NULL)
    @ApiPostCondition(MUST_RETURN_NEW_STATE)
    ServerResponse<TravelResponse> create(TravelRequest request);

    @ApiPostCondition(MUST_RETURN_NEW_STATE)
    ServerResponse<TravelResponse> find(Long travelId);


    @ApiExceptionResponse({
            InvalidTravelCompanionSizeFailException.class,
            InvalidTravelMotivationSizeFailException.class,
            TravelNameTooLongFailException.class,
            InvalidTravelNameCharacterFailException.class,
            InvalidTravelDateFormatFailException.class,
            TravelPeriodTooLongFailException.class
    })
    @ApiPostCondition(MUST_GENERATE_NAME_IF_NULL)
    @ApiPostCondition(MUST_RETURN_NEW_STATE)
    ServerResponse<TravelResponse> update(Long travelId, TravelRequest request);

}
