package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.service.TravelInvitationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class JoinTravelService {

    private final MemberTravelRepository travelRepository;
    private final TravelInvitationService invitationService;

    private final MemberService memberService;

    /**
     * 초대를 수락해 여행에 가입한 뒤, 해당 초대를 만료한다.
     * @param travelId 가입할 여행의 식별자
     * @param invitationId 받은 초대의 식별자 (필수)
     * @param inviteeId 가입할 사용자의 식발자
     */
    @Transactional
    public void call(Long travelId, String invitationId, String inviteeId) {

        final TravelInvitation invitation = invitationService.find(travelId, invitationId);

        final MemberTravel travel = travelRepository.findById(invitation.travelId())
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final Member invitee = memberService.find(inviteeId);
        final Member inviter = memberService.find(invitation.memberId());

        travel.addParticipant(inviter, invitee);
        invitationService.delete(invitation);
    }

}
