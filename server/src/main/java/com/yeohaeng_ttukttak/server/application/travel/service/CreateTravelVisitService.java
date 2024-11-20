package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.AuthorizationErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ForbiddenErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CreateTravelVisitService {

    private final MemberTravelRepository travelRepository;
    private final MemberRepository memberRepository;
    private final PlaceRepository placeRepository;

    @Transactional
    public void call(Long travelId, String memberId, Long placeId, Integer dayOfTravel) {

        final MemberTravel travel = travelRepository
                .findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        final long totalDays = LocalDateUtil.getBetweenDays(travel.startedOn(), travel.endedOn());

        if (dayOfTravel < 0 || dayOfTravel >= totalDays) {
            throw new ArgumentNotInRangeFailException("dayOfTravel", 0, totalDays);
        }

        final Member member = memberRepository
                .findById(UUID.fromString(memberId))
                .orElseThrow(AuthorizationErrorException::new);

        if (!Objects.equals(travel.member(), member)) {
            throw new ForbiddenErrorException(Travel.class);
        }

        final Place place = placeRepository
                .findById(placeId)
                .orElseThrow(() -> new EntityNotFoundFailException(Place.class));

        travel.addVisit(place, dayOfTravel);
    }

}
