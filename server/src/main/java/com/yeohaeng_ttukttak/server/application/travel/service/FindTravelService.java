package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FindTravelService {

    private final MemberTravelRepository memberTravelRepository;

    /**
     * 지정한 사용자의 모든 여행을 반환한다.
     * @param memberId 조회할 사용자의 식별자
     * @return 해당 사용자의 모든 여행 객체
     */
    public List<TravelDto> findMyTravels(String memberId) {

        final List<Travel> travels = memberTravelRepository
                .findAllByMemberId(UUID.fromString(memberId));

        return travels.stream()
                .map(TravelDto::of)
                .toList();
    }




}