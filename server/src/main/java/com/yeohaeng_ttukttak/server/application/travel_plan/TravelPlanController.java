package com.yeohaeng_ttukttak.server.application.travel_plan;

import com.yeohaeng_ttukttak.server.application.travel_plan.dto.CreateTravelPlanRequest;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.TravelPlanListResponse;
import com.yeohaeng_ttukttak.server.application.travel_plan.dto.MoveTravelPlanRequest;
import com.yeohaeng_ttukttak.server.common.authentication.Authentication;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlanDto;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@JsonRequestMapping("/api/v2/travels/{travelId}/plans")
@RequiredArgsConstructor
@Tag(name = "여행 일정(Travel Plan)", description = "여행 일정과 관련된 동작을 수행하는 컬렉션 입니다.")
public class TravelPlanController {

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
    public ServerResponse<TravelPlanListResponse> create(
            @PathVariable Long travelId,
            @RequestBody CreateTravelPlanRequest request) {

        travelPlanService.create(
                travelId, request.placeId(), request.dayOfTravel());

        return responsePlanList(travelId);
    }

    /**
     * 지정한 사용자 여행의 계획 목록을 조회합니다.
     *
     * @param travelId 사용자 여행의 식별자
     * @return 조회된 사용자 여행의 일정 목록
     */
    @GetMapping
    public ServerResponse<TravelPlanListResponse> findAll(
            @PathVariable Long travelId) {
        return responsePlanList(travelId);
    }

    /**
     * 지정한 여행 계획의 순서 및 방문 일자를 변경합니다.
     *
     * <ul>
     *     <li>여행 생성자 및 참여자만 일정을 변경할 수 있습니다.</li>
     * </ul>
     *
     * @param travelId 사용자 여행의 식별자
     * @param planId 여행 일정의 식별자
     * @param request 변경할 여행 일정 정보
     * @return 변경된 사용자 여행의 일정 목록
     *         <ul>
     *          <lu>지정한 일정 정보를 선택적으로 변경합니다.</lu>
     *          <li>지정한 순서와 같거나 큰 기존 계획의 순서를 뒤로 밉니다.</li>
     *         </ul>
     */
    @PatchMapping("/{planId}")
    @Authentication
    public ServerResponse<TravelPlanListResponse> move(
            @PathVariable Long travelId,
            @PathVariable Long planId,
            @Valid @RequestBody MoveTravelPlanRequest request) {

        travelPlanService.move(travelId, planId, request.orderOfPlan(), request.willVisitOn());

        return responsePlanList(travelId);
    }

    /**
     * 지정한 여행 일정을 계획 목록에서 삭제합니다.
     *
     * <ul>
     *     <li>여행 생성자 및 참여자만 일정을 삭제할 수 있습니다.</li>
     * </ul>
     *
     * @param travelId 사용자 여행의 식별자
     * @param planId 여행 일정의 식별자
     * @return 삭제 후의 여행 일정 목록
     */
    @DeleteMapping("/{planId}")
    @Authentication
    public ServerResponse<TravelPlanListResponse> delete(
            @PathVariable Long travelId, @PathVariable Long planId) {

        travelPlanService.delete(travelId, planId);

        return responsePlanList(travelId);
    }

    private ServerResponse<TravelPlanListResponse> responsePlanList(Long travelId) {
        final List<TravelPlanDto> dtoList = travelPlanService.findAll(travelId);
        return new ServerResponse<>(new TravelPlanListResponse(dtoList));
    }

}
