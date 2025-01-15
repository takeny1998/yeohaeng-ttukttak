package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import jakarta.validation.constraints.*;

import java.time.LocalDate;
import java.util.List;

/**
 * 사용자 여행 생성을 위한 요청 객체입니다.
 *
 * @param name 여행 이름으로 사용할 문자열.
 *                  <ul>
 *                      <li>선택한 도시(City)의 상위 지역(Province) 이름들로 구성됩니다.</li>
 *                      <ul>
 *                          <li><b>서울시 중구, 도봉구</b>: 서울 여행<br/></li>
 *                          <li><b>서울시 중구, 경기도 수원시</b>: 서울, 경기 여행</li>
 *                      </ul>
 *                      <li>각 지역(Province) 이름은 요청 언어에 따라 한국어 또는 영어로 변경됩니다.</li>
 *                  </ul>
 * @param startedOn 여행의 시작 날짜.
 * @param endedOn 여행의 종료 날짜.
 * @param companionTypes 동반자 타입 목록
 * @param motivationTypes 여행 동기 목록
 * @param cityIds 방문할 도시의 식별자 목록
 */
public record TravelRequest(
        String name,
        @NotNull LocalDate startedOn,
        @NotNull LocalDate endedOn,
        @NotNull List<CompanionType> companionTypes,
        @NotNull List<MotivationType> motivationTypes,
        @NotNull List<Long> cityIds
) { }
