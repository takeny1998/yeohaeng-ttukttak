package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.InputTravel;
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
    private final GeographyRepository geographyRepository;

    @Transactional
    public void call(CreateTravelCommand comm) {

        List<Long> ids = EntityReference.extractId(comm.cities());

        final Member member = memberService.find(comm.memberId());

        final InputTravel travel = new InputTravel(
                member,
                comm.startedOn(),
                comm.endedOn(),
                comm.companion());

        geographyRepository.findAllCityByIds(ids)
                .forEach(travel::addCity);

        travelRepository.save(travel);

    }

}
