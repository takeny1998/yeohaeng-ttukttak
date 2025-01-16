package com.yeohaeng_ttukttak.server.application.travel_plan.dto;

import java.time.LocalDate;

/**
 * 여행 일정을 이동하기 위한 요청 객체입니다.
 *
 * @param orderOfPlan 변경하고 싶은 계획의 순서
 * @param willVisitOn 변경할 일정의 방문 일자
 *                    <ul>
 *                      <li>방문 일자는 해당 여행의 일자 범위에 있어야 합니다.</li>
 *                    </ul>
 */
public record MoveTravelPlanRequest(
        Integer orderOfPlan,
        LocalDate willVisitOn
) {}
