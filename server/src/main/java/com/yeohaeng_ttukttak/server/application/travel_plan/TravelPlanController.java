package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.application.travel_plan.dto.CreateTravelPlanRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.MoveTravelPlanRequest;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.doc.TravelPlanDocument;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@JsonRequestMapping("/api/v2/travels/{travelId}/plans")
@RequiredArgsConstructor
public class TravelPlanController implements TravelPlanDocument {

    private final TravelPlanService travelPlanService;

    /**
     * 지정한 사용자 여행에 새로운 여행 일정을 추가합니다.
     *
     * <ul>
     *     <li>여행 생성자 및 참여자만 일정을 추가할 수 있습니다.</li>
     * </ul>
     *
     * @param travelId 사용자 여행의 식별자
     * @param request 추가할 여행 일정 정보
     * @return 변경된 사용자 여행의 일정 목록
     */
    @PostMapping
    @Authentication
    public TravelPlanListResponse create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelPlanRequest request) {

        travelPlanService.create(
                travelId, request.placeId(), request.dayOfTravel());

        return responsePlanList(travelId);
    }

    @GetMapping
    public TravelPlanListResponse findAll(
            @PathVariable Long travelId) {
        return responsePlanList(travelId);
    }

    @PatchMapping("/{planId}")
    @Authentication
    public TravelPlanListResponse move(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @RequestBody MoveTravelPlanRequest request) {

        travelPlanService.move(travelId, planId, request.orderOfPlan(), request.willVisitOn());

        return responsePlanList(travelId);
    }

    @DeleteMapping("/{planId}")
    @Authentication
    public TravelPlanListResponse delete(
            @PathVariable Long travelId, @PathVariable Long planId) {

        travelPlanService.delete(travelId, planId);

        return responsePlanList(travelId);
    }

    private TravelPlanListResponse responsePlanList(Long travelId) {
        final List<TravelPlanDto> dtoList = travelPlanService.findAll(travelId);
        return new TravelPlanListResponse(dtoList);
    }

}
