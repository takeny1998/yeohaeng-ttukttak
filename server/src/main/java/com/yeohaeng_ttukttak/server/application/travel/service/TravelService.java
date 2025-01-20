package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class TravelService {

    private final TravelRepository travelRepository;

    private final GeographyRepository geographyRepository;

    /**
     * 새로운 여행을 생성합니다.
     * @param inputName (nullable) 여행의 이름
     * @param startedOn 여행의 시작 날짜
     * @param endedOn 여행의 종료 날짜
     * @param motivationTypes 선택된 여행 동기 리스트
     * @param companionTypes 선택된 동행 타입 리스트
     * @return 생성된 Travel 엔티티의 식별자
     */
    @Transactional
    public Long create(
            String inputName,
            LocalDate startedOn,
            LocalDate endedOn,
            List<MotivationType> motivationTypes,
            List<CompanionType> companionTypes,
            List<Long> cityIds) {

        final List<City> cities = geographyRepository.findCitiesByIds(cityIds);

        if (!Objects.equals(cities.size(), cityIds.size())) {
            throw ExceptionCode.ENTITY_NOT_FOUND_FAIL.getInstance();
        }

        final Travel travel = new Travel(
            inputName, startedOn, endedOn, cities, companionTypes, motivationTypes);

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
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::getInstance);

        return TravelDto.of(travel);
    }

    /**
     * 지정한 여행의 속성들을 파라미터 값으로 수정합니다.
     *
     * <ul>
     *     <li>값이 null이 아닌 속성만 수정됩니다.</li>
     * </ul>
     *
     * @param travelId 여행의 식별자
     * @param inputName {@link Travel#rename(String)}
     * @param startedOn {@link Travel#updateDates(LocalDate startedOn, LocalDate)}
     * @param endedOn {@link Travel#updateDates(LocalDate, LocalDate endedOn)}
     * @param motivationTypes {@link Travel#updateMotivationsTypes(List)}
     * @param companionTypes {@link Travel#updateCompanionTypes(List)}
     */
    @Transactional
    public void update(
            final Long travelId,
            final String inputName,
            final LocalDate startedOn,
            final LocalDate endedOn,
            final List<MotivationType> motivationTypes,
            final List<CompanionType> companionTypes,
            final List<Long> cityIds
    ) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::getInstance);

        if (Objects.nonNull(inputName)) {
            travel.rename(inputName);
        }

        if (Objects.nonNull(startedOn) || Objects.nonNull(endedOn)) {
            travel.updateDates(startedOn, endedOn);
        }

        if (Objects.nonNull(companionTypes)) {
            travel.updateCompanionTypes(companionTypes);
        }

        if (Objects.nonNull(motivationTypes)) {
            travel.updateMotivationsTypes(motivationTypes);
        }

        if (Objects.nonNull(cityIds)) {

            final List<City> cities = geographyRepository.findCitiesByIds(cityIds);

            if (!Objects.equals(cities.size(), cityIds.size())) {
                throw ExceptionCode.ENTITY_NOT_FOUND_FAIL.getInstance();
            }

            travel.updateCities(cities);
        }

    }

}
