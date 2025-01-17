package com.yeohaeng_ttukttak.server.domain.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelInvitationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class TravelInvitationService {

    private final TravelInvitationRepository repository;

    /**
     * 30분간 사용자 한 명을 초대할 수 있는 초대를 생성한다.
     * @param travel 초대할 여행 엔티티
     * @param invitorId 초대하는 사용자의 식별자
     * @return 생성된 여행 초대의 식별자
     */
    @Transactional
    public String create(Travel travel, String invitorId) {
//        travel.verifyParticipantsOrCreator(invitorId);

        final TravelInvitation invitation = repository.save(
                new TravelInvitation(travel.id(), invitorId));

        return invitation.id();
    }

    /**
     * 지정된 여행의 초대를 조회한다.
     * @param travelId 초대할 여행의 식별자
     * @param invitationId 초대의 식별자
     * @throws EntityNotFoundFailException invitationId로 조회된 여행 초대가 없거나 만료된 경우 발생한다.
     * @throws InvalidArgumentFailException 초대할 여행이 잘못 지정될 경우 발생한다.
     * @return 조회된 여행 초대 엔티티
     */
    public TravelInvitation find(Long travelId, String invitationId) {
        final TravelInvitation invitation = repository.findById(invitationId)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelInvitation.class));

        return invitation;
    }

    @Transactional
    public void delete(TravelInvitation invitation) {
        repository.delete(invitation);
    }

}

