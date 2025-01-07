package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import io.swagger.v3.oas.annotations.media.Schema;

import java.util.List;

/**
 * 생성된 사용자 여행 정보를 나타내는 응답 객체입니다.
 *
 * @param travel 생성된 사용자 여행의 기본 정보
 *
 * @param cities 사용자 여행에서 방문할 도시 목록
 */
public record CreateTravelResponse(
        TravelDto travel,
        List<GeographyDto> cities) { }
