package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelDates;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelName;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelNameService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class TravelService {

    private final TravelNameService travelNameService;

    private final TravelRepository travelRepository;

    private final GeographyRepository geographyRepository;

    private final MemberService memberService;

    /**
     * 새로운 여행을 생성합니다.
     * @param locale 현재 요청의 로케일 정보
     * @param inputName (nullable) 여행의 이름
     * @param startedOn 여행의 시작 날짜
     * @param endedOn 여행의 종료 날짜
     * @param motivationTypes 선택된 여행 동기 리스트
     * @param companionTypes 선택된 동행 타입 리스트
     * @return 생성된 Travel 엔티티의 식별자
     */
    @Transactional
    public Long create(
            Locale locale,
            String inputName,
            LocalDate startedOn,
            LocalDate endedOn,
            List<MotivationType> motivationTypes,
            List<CompanionType> companionTypes,
            List<Long> cityIds,
            String creatorId) {

        final Member creator = memberService.find(creatorId);

        final List<City> cities = geographyRepository.findCitiesByIds(cityIds);

        if (!Objects.equals(cities.size(), cityIds.size())) {
            throw new EntityNotFoundFailException(City.class);
        }

        final TravelDates dates = new TravelDates(startedOn, endedOn);

        final Travel travel = new Travel(
              dates, cities, companionTypes, motivationTypes);

        travelNameService.initializeName(locale, travel, inputName);

        final Travel savedTravel = travelRepository.save(travel);

        return savedTravel.id();
    }

    /**
     * 지정한 식별자에 맞는 여행을 DTO로 변환해 반환합니다.
     * @param travelId 조회할 여행의 식별자
     * @return DTO로 변환된 여행 정보
     */
    @Transactional(readOnly = true)
    public TravelDto findById(Long travelId) {
        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        return TravelDto.of(travel);
    }

    @Transactional
    public void update(
            Long travelId, String inputName) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundFailException(Travel.class));

        travelNameService.applyName(travel, inputName);



    }

}
