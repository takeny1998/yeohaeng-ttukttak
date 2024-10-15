package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FindMyAllTravelService {

    private final MemberTravelRepository travelRepository;

    public List<TravelDto> call(String memberId) {

        List<Travel> travels = travelRepository
                .findAllByMemberId(UUID.fromString(memberId));

        return travels.stream()
                .map(TravelDto::of)
                .toList();

    }

}
