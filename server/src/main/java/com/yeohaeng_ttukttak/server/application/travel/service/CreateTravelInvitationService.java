package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.service.TravelInvitationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CreateTravelInvitationService {

    private final TravelInvitationService invitationService;
    private final TravelRepository travelRepository;

    /**
     * 30분간 한 명을 초대할 수 있는 링크를 만들어 반환 한다.
     * @param travelId 초대할 여행의 식별자
     * @param invitorId 초대하는 사용자의 식별자
     * @return 생성된 여행 초대의 식별자
     */
    @Transactional
    public String createOne(String invitorId, Long travelId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return invitationService.create(travel, invitorId);
    }

}
