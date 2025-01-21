package com.yeohaeng_ttukttak.server.application.travel_plan.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;

import java.util.List;

/**
 * 사용자 여행의 일정 목록을 표현하는 응답 객체입니다.
 */
public final class TravelPlanListSuccessResponse extends ServerSuccessResponse<TravelPlanListSuccessResponse.Data> {

    /**
     * @param plans 여행 일정 목록
     *              <ul>
     *                  <li>해당 목록은 다음과 같은 규칙에 따라 정렬됩니다:</li>
     *                  <ol>
     *                      <li>방문일자(willVisitOn)가 빠른 일정부터 정렬됩니다.</li>
     *                      <li>일자가 같은 경우, 순서(orderOfPlan)이 작은 순으로 정렬됩니다.</li>
     *                  </ol>
     *              </ul>
     */
    public TravelPlanListSuccessResponse(List<TravelPlanDto> plans) {
        super(new Data(plans));
    }

    public record Data(List<TravelPlanDto> plans) { }
}
