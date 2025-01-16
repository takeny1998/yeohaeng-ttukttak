package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

import java.util.List;

/**
 * 사용자 여행 정보를 나타내는 응답 객체입니다.
 *
 * <pre>
 * name을 지정하지 않은 경우, 여행 이름은 다음과 같이 자동 생성됩니다:
 * <ul>
 *     <li><b>선택한 도시(City)</b>의 상위 지역(Province) 이름으로 구성됩니다:</li>
 *     <ul>
 *         <li><b>서울시 중구, 도봉구</b>: 서울 여행</li>
 *         <li><b>서울시 중구, 경기도 수원시</b>: 서울, 경기 여행</li>
 *     </ul>
 *     <li>각 지역(Province) 이름은 요청 언어에 따라 한국어 또는 영어로 표시됩니다.</li>
 * </ul>
 * </pre>
 *
 * @param travel 생성된 사용자 여행의 기본 정보
 * @param cities 사용자 여행에서 방문할 도시 목록
 */
public record TravelResponse(
        TravelDto travel,
        List<GeographyDto> cities) { }