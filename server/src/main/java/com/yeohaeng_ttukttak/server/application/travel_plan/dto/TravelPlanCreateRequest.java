package com.yeohaeng_ttukttak.server.application.travel_plan.dto;


import jakarta.validation.constraints.NotNull;

/**
 * 새로운 일정을 생성하기 위한 요청 객체입니다.
 * @param placeId 일정에서 방문할 장소(Place)의 식별자
 * @param dayOfTravel 일정을 수행알 여행의 일차
 *                    <ul>
 *                      <li>
 *                          시작 값은 0이며, (여행 기간 - 1)까지 지정할 수 있습니다. <br/>
 *                          (4박 5일 여행인 경우, 0부터 4까지 지정할 수 있습니다)
 *                      </li>
 *                    </ul>
 */
public record TravelPlanCreateRequest(
       @NotNull Long placeId,
       @NotNull Integer dayOfTravel
) { }
