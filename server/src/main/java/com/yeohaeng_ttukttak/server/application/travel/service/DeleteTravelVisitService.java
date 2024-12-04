package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class DeleteTravelVisitService {

    private final MemberTravelRepository travelRepository;

    @Transactional
    public void call(Long travelId, Long visitId, String memberId) {

        final MemberTravel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        travel.verifyModifyGrant(memberId);

        travel.removeVisit(visitId);
    }

}
