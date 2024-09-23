package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.place.entity.City;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.InputTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCity;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CreateTravelService {

    private final MemberService memberService;
    private final TravelRepository travelRepository;

    @Transactional
    public TravelDto call(CreateTravelCommand comm) {
        final Member member = memberService.find(comm.memberId());

        final InputTravel travel = new InputTravel(
                member,
                comm.name(),
                comm.startedOn(),
                comm.endedOn(),
                comm.companionType());

        comm.cities().forEach((City city) -> new TravelCity(travel, city));

        travelRepository.save(travel);

        return new TravelDto(travel);
    }

}
