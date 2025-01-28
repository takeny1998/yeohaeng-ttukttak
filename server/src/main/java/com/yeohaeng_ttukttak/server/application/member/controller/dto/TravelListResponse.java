package com.yeohaeng_ttukttak.server.application.member.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;

import java.util.List;

/**
 * 사용자 여행 목록을 나타내는 응답 객체입니다.
 */
public final class TravelListResponse extends ServerSuccessResponse<TravelListResponse.TravelListData> {

    /**
     * @param travels 사용자 여행 목록
     *                <ul>
     *                  <li>해당 목록은 다음과 같은 규칙에 따라 정렬됩니다:</li>
     *                  <ol>
     *                      <li>시작일(startedON)이 빠른 여행부터 정렬됩니다.</li>
     *                      <li>종료일(endedOn)이 빠른 순으로 정렬됩니다.</li>
     *                      <li>여행의 식별자가 작은 순으로 정렬됩니다.</li>
     *                  </ol>
     *                </ul>
     */
    public TravelListResponse(List<TravelDto> travels) {
        super(new TravelListData(travels));
    }

    public record TravelListData(List<TravelDto> travels) { }
}
