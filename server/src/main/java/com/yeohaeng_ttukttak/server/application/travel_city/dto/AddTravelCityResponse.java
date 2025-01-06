package com.yeohaeng_ttukttak.server.application.travel_city.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;

import java.util.List;

/**
 * 변경된 사용자 여행 정보를 나타내는 응답 객체입니다.
 *
 * @param travel 변경된 사용자 여행의 기본 정보
 *
 * @param cities 변경된 여행의 도시 목록
 */
public record AddTravelCityResponse(
        TravelDto travel,
        List<GeographyDto> cities) { }
