package com.yeohaeng_ttukttak.server.application.invitation.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelInvitationCommand;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelInvitationRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class TravelInvitationService {

    private final TravelInvitationRepository repository;

    private final MemberTravelRepository travelRepository;
    private final MemberService memberService;

    /**
     * 30분간 한 명을 초대할 수 있는 링크를 만들어 반환 한다.
     * @param travelId 초대할 여행의 식별자
     * @param memberId 초대하는 사용자의 식별자
     * @return 생성된 여행 초대의 식별자
     */
    @Transactional
    public String create(String memberId, Long travelId) {

        final MemberTravel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        travel.verifyWriteGrant(memberId);

        final TravelInvitation invitation = repository.save(
                new TravelInvitation(memberId, travelId));

        return invitation.id();
    }

    @Transactional(readOnly = true)
    public TravelInvitationDto find(String id) {
        final TravelInvitation invitation = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelInvitation.class));

        return TravelInvitationDto.of(invitation);
    }

    /**
     * 초대를 수락해 여행에 가입한 뒤, 해당 객체를 만료 시킨다.
     * @param id 받은 초대 식별자
     */
    @Transactional
    public void accept(String id, String memberId) {

        final TravelInvitation invitation = repository.findById(id)
                .orElseThrow(() -> new EntityNotFoundFailException(TravelInvitation.class));

        final MemberTravel travel = travelRepository.findById(invitation.travelId())
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final Member member = memberService.find(memberId);

        travel.addParticipant(member);
        repository.delete(invitation);
    }

}
