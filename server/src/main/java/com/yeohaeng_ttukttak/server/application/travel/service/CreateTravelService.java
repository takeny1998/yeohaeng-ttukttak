package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.CreateTravelCommand;
import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CreateTravelService {

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;

    @Transactional
    public Long call(CreateTravelCommand commend) {

        List<Long> ids = EntityReference.extractId(commend.cities());

        final Travel travel = new Travel(commend.startedOn(), commend.endedOn());

        geographyRepository.findAllCityByIds(ids)
                .forEach(travel::addCity);

        commend.motivationTypes().forEach(travel::addMotivation);
        commend.companionTypes().forEach(travel::addCompanion);

        final Travel savedTravel = travelRepository.save(travel);

        return savedTravel.id();
    }

}
