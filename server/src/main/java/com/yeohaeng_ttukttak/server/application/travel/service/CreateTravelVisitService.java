package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeniedException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.InvalidAuthorizationException;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelVisitRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateTravelVisitService {

    private final MemberTravelRepository travelRepository;
    private final TravelVisitRepository travelVisitRepository;
    private final MemberRepository memberRepository;
    private final PlaceRepository placeRepository;

    @Transactional
    public TravelVisitDto call(Long travelId, String memberId, Long placeId) {

        final MemberTravel travel = travelRepository
                .findById(travelId)
                .orElseThrow(() -> new EntityNotFoundException(Travel.class));

        final Member member = memberRepository
                .findById(UUID.fromString(memberId))
                .orElseThrow(InvalidAuthorizationException::new);

        if (!Objects.equals(travel.member(), member)) {
            throw new AccessDeniedException(Travel.class);
        }

        final Place place = placeRepository
                .findById(placeId)
                .orElseThrow(() -> new EntityNotFoundException(Place.class));

        TravelVisit visit = new TravelVisit(travel, place);
        travelVisitRepository.save(visit);

        return TravelVisitDto.of(visit);
    }

}
