package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FindTravelService {

    private final TravelRepository travelRepository;

    public TravelDto findById(Long travelId) {
        final Travel foundTravel = travelRepository
                .findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return TravelDto.of(foundTravel);
    }

    /**
     * 지정한 사용자의 모든 여행을 반환한다.
     * @param memberId 조회할 사용자의 식별자
     * @return 해당 사용자의 모든 여행 객체
     */
    public List<TravelDto> findByMember(String memberId) {

        final List<Travel> travels = travelRepository
                .findAllByMemberId(memberId);

        return travels.stream()
                .map(TravelDto::of)
                .toList();
    }




}
