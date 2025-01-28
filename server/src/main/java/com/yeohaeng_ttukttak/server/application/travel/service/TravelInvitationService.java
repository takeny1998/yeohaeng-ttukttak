package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelInvitationDto;
import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelInvitationRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelCreatorRole;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelParticipantRole;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TravelInvitationService {

    private final TravelRepository travelRepository;

    private final TravelInvitationRepository invitationRepository;

    /**
     * 30분간 유효한 초대를 생성한다.
     *
     * @param travelId 초대할 여행의 식별자
     * @param invitorId 초대하는 사용자의 식별자
     *
     * @return 생성된 초대 객체를 DTO로 변환해 반환한다.
     *
     */
    public TravelInvitationDto create(final Long travelId, final String invitorId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(invitorId)
                .or(new TravelCreatorRole(travel))
                .or(new TravelParticipantRole(travel))
                .authorize();

        final TravelInvitation invitation = invitationRepository.save(
                new TravelInvitation(travel.id(), invitorId));

        return TravelInvitationDto.of(invitation);

    }

}
