package com.yeohaeng_ttukttak.server.application.member.service;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberTravelService {

    private final TravelRepository travelRepository;

    /**
     * 지정한 사용자가 참여한 모든 여행 시작일, 종료일, 식별자 오름차순으로 정렬해 반환한다.
     * @param memberId 조회할 사용자의 식별자
     * @return 해당 사용자의 모든 여행 객체
     */
    @Transactional(readOnly = true)
    public List<TravelDto> findByMemberId(String memberId) {
        final List<Travel> travels = travelRepository
                .findAllMemberParticipated(memberId);

        return travels.stream()
                .map(TravelDto::of)
                .toList();
    }



}
