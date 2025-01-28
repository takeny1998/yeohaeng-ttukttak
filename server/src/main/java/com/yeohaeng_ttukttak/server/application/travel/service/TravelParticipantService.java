package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelParticipantRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.ENTITY_NOT_FOUND_FAIL;

@Service
@RequiredArgsConstructor
public class TravelParticipantService {

    private final MemberService memberService;

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
     * 지정한 참여자를 해당 여행에서 내쫒는다.
     * @param travelId 여행의 식별자
     * @param kickerId 쫒아내는 사용자의 식별자
     * @param participantId 쫒아낼 참여자의 식별자
     */
    @Transactional
    public void leave(Long travelId, String kickerId, Long participantId) {
        final TravelParticipant participant = participantRepository.findById(participantId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        final Member kicker = memberService.find(kickerId);
        final Travel travel = participant.getTravel();

        travel.leaveParticipant(kicker, participant);
    }

}
