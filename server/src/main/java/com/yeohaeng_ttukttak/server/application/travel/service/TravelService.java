package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.dto.EntityReference;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelName;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelNameService;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class TravelService {

    private final TravelNameService nameService;

    private final TravelRepository travelRepository;
    private final GeographyRepository geographyRepository;

    /**
     * 새로운 여행을 생성합니다.
     * @param locale 현재 요청의 로케일 정보
     * @param inputtedName (nullable) 여행의 이름
     * @param startedOn 여행의 시작 날짜
     * @param endedOn 여행의 종료 날짜
     * @param motivationTypes 선택된 여행 동기 리스트
     * @param companionTypes 선택된 동행 타입 리스트
     * @param cityIds 선택된 도시 ID 리스트
     * @return 생성된 Travel 엔티티의 식별자
     */
    public Long create(
            Locale locale,
            String inputtedName,
            LocalDate startedOn,
            LocalDate endedOn,
            List<MotivationType> motivationTypes,
            List<CompanionType> companionTypes,
            List<EntityReference<Long>> cityIds) {

        final List<City> cities = geographyRepository
                .findCitiesByIds(EntityReference.extractId(cityIds));

        final TravelName travelName = Objects.isNull(inputtedName)
                ? nameService.generateDefaultName(locale, cities)
                : nameService.validateInputName(inputtedName);

        final Travel travel = new Travel(travelName, startedOn, endedOn);

        cities.forEach(travel::addCity);
        motivationTypes.forEach(travel::addMotivation);
        companionTypes.forEach(travel::addCompanion);

        final Travel savedTravel = travelRepository.save(travel);

        return savedTravel.id();
    }


}
