package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelInvitationRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelParticipantRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TravelParticipantService {

    private final TravelRepository travelRepository;

    private final MemberService memberService;

    private final TravelInvitationRepository invitationRepository;
    private final TravelParticipantRepository participantRepository;

    @Transactional(readOnly = true)
    public List<TravelParticipantDto> find(Long travelId) {
        final List<TravelParticipant> participants =
                participantRepository.findAllByTravelId(travelId);

        return participants.stream()
                .map(TravelParticipantDto::of)
                .toList();
    }

    /**
     * 초대를 통해 지정한 여행에 참여한 뒤, 해당 초대를 만료한다.
     * @param travelId 가입할 여행의 식별자
     * @param invitationId 받은 초대의 식별자 (필수)
     * @param inviteeId 가입할 사용자의 식발자
     */
    @Transactional
    public void join(Long travelId, String invitationId, String inviteeId) {

        final TravelInvitation invitation = invitationRepository.findById(invitationId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        final Travel travel = travelRepository.findById(invitation.travelId())
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        final Member invitee = memberService.find(inviteeId);
        final Member inviter = memberService.find(invitation.memberId());

        travel.joinParticipant(inviter, invitee);

        invitationRepository.delete(invitation);
    }

    /**
     * 지정한 참여자를 해당 여행에서 내쫒는다.
     * @param travelId 여행의 식별자
     * @param kickerId 쫒아내는 사용자의 식별자
     * @param participantId 쫒아낼 참여자의 식별자
     */
    @Transactional
    public void leave(Long travelId, String kickerId, Long participantId) {
        final TravelParticipant participant = participantRepository.findById(participantId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        final Member kicker = memberService.find(kickerId);
        final Travel travel = participant.travel();

        travel.leaveParticipant(kicker, participant);
    }

}
