package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.travel.entity.InputTravel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.RegionRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CreateTravelService {

    private final MemberService memberService;
    private final TravelRepository travelRepository;
    private final RegionRepository regionRepository;

    @Transactional
    public void call(CreateTravelCommand comm) {

        List<Long> ids = EntityReference.extractId(comm.cities());

        final Member member = memberService.find(comm.memberId());

        final InputTravel travel = new InputTravel(
                member,
                comm.name(),
                comm.startedOn(),
                comm.endedOn(),
                comm.companionType());

        regionRepository.findAllCityByIds(ids)
                .forEach(travel::addCity);

        travelRepository.save(travel);

    }

}
