package com.yeohaeng_ttukttak.server.domain.travel.role;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class TravelRoleService {

    private final TravelRepository travelRepository;

    public TravelCreatorRole creator(final Long travelId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return new TravelCreatorRole(travel);
    }

    public TravelParticipantRole participant(final Long travelId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return new TravelParticipantRole(travel);
    }

}
