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
 *             <ul>
 *                  <li>크기는 100Byte(euc-kr 기준)가 넘지 않아야 합니다.</li>
 *                  <li>이름에 한글, 영문, 공백( ), 콤마(,)를 사용할 수 있습니다.</li>
 *                  <li>입력하지 않은 경우, 자동 생성된 이름이 부여됩니다:</li>
 *                  <ul>
 *                      <li>선택한 도시(City)의 상위 지역(Province) 이름들로 구성됩니다.</li>
 *                      <ul>
 *                          <li><b>서울시 중구, 도봉구</b>: 서울 여행<br/></li>
 *                          <li><b>서울시 중구, 경기도 수원시</b>: 서울, 경기 여행</li>
 *                      </ul>
 *                      <li>각 지역(Province) 이름은 요청 언어에 따라 한국어 또는 영어로 변경됩니다.</li>
 *                  </ul>
 *            </ul>
 * @param startedOn 여행의 시작 날짜.
 *                  <ul>
 *                      <li>종료 날짜(endedOn)보다 같거나 빨라야 합니다.</li>
 *                  </ul>
 * @param endedOn 여행의 종료 날짜.
 *                <ul>
 *                      <li>시작 날짜(startedOn) 보다 같거나 느려야 합니다.</li>
 *                      <li>시작 날짜(startedOn) 기준으로 60일을 초과할 수 없습니다.</li>
 *                </ul>
 * @param companionTypes 동반자 타입 목록
 *                       <ul>
 *                          <li>최소 1개, 최대 3개까지 지정할 수 있습니다</li>
 *                       </ul>
 * @param motivationTypes 여행 동기 목록
 *                        <ul>
 *                          <li>최소 1개, 최대 5개까지 지정할 수 있습니다.</li>
 *                        </ul>
 * @param cityIds 방문할 도시의 식별자 목록
 *                <ul>
 *                    <li>도시(City) 엔티티의 식별자만 지정할 수 있습니다.</li>
 *                    <li>최소 1개, 최대 10개까지 지정할 수 있습니다.</li>
 *                </ul>
 */
public record TravelRequest(
        String name,
        @NotNull LocalDate startedOn,
        @NotNull LocalDate endedOn,
        @NotNull List<CompanionType> companionTypes,
        @NotNull List<MotivationType> motivationTypes,
        @NotNull List<Long> cityIds
) { }
