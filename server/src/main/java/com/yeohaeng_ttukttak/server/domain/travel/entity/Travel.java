package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Slf4j
@Configurable(autowire = Autowire.BY_TYPE, preConstruction = true)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Travel extends BaseTimeMemberEntity {

    @Id @GeneratedValue
    private Long id;

    @Embedded
    private TravelName name;

    @Embedded
    private TravelDates dates;

    @OrderBy("id ASC nulls last")
    @OneToMany(mappedBy = "travel", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelCity> cities = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelCompanion> companions = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelMotivation> motivations = new ArrayList<>();

    @OrderBy("dayOfTravel ASC nulls last, orderOfPlan ASC nulls last, id ASC nulls last")
    @OneToMany(mappedBy = "travel", cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
    private List<TravelPlan> plans = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = { CascadeType.PERSIST, CascadeType.MERGE }, orphanRemoval = true)
    private List<TravelParticipant> participants = new ArrayList<>();

    /**
     * 새로운 여행을 생성합니다.
     *
     * @param inputName 여행 이름
     * @param startedOn 여행 시작 날짜
     * @param endedOn 여행의 종료 날짜
     * @param cities 여행에서 들릴 도시 목록
     * @param companionTypes 여행의 동반 타입 목록
     * @param motivationTypes 여행의 동기 목록
     *
     * @see TravelName#TravelName(String, List)
     * @see TravelDates#TravelDates(LocalDate, LocalDate)
     * @see Travel#updateCities(List)
     * @see Travel#updateMotivationsTypes(List) 
     * @see Travel#updateCompanionTypes(List) 
     */
    public Travel(
            final String inputName,
            final LocalDate startedOn,
            final LocalDate endedOn,
            final List<City> cities,
            final List<CompanionType> companionTypes,
            final List<MotivationType> motivationTypes) {

        this.name = new TravelName(inputName, cities);
        this.dates = new TravelDates(startedOn, endedOn);

        updateCities(cities);
        updateCompanionTypes(companionTypes);
        updateMotivationsTypes(motivationTypes);
    }

    public Long id() {
        return id;
    }

    public String name() {
        if (Objects.isNull(name)) return null;
        return name.name();
    }

    public List<TravelParticipant> participants() {
        return participants;
    }

    public LocalDate startedOn() {
        return dates.startedOn();
    }

    public LocalDate endedOn() {
        return dates.endedOn();
    }

    public List<TravelCompanion> companions() {
        return companions;
    }

    public List<TravelMotivation> motivations() {
        return motivations;
    }

    public List<TravelCity> cities() {
        return cities;
    }

    public List<TravelPlan> plans() {
        return plans;
    }


    /**
     * @see TravelName#updateName(String)
     */
    public void rename(final String inputName) {
        this.name.updateName(inputName);
    }


    /**
     * @see TravelDates#updateDates(LocalDate, LocalDate)
     */
    public void updateDates(final LocalDate startedOn, final LocalDate endedOn) {
        this.dates.updateDates(startedOn, endedOn);
    }

    /**
     * 여행의 동기 목록을 수정합니다.
     *
     * @param motivationTypes 새로운 여행 동기 목록
     * @throws FailException if motivationTypes.size() not between 1 and 5
     */
    public void updateMotivationsTypes(final List<MotivationType> motivationTypes) {

        motivations.clear();

        final List<TravelMotivation> newMotivations = motivationTypes
                .stream()
                .map(motivationType -> new TravelMotivation(this, motivationType))
                .toList();

        motivations.addAll(newMotivations);

        if (this.motivations.isEmpty() || this.motivations.size() > 5) {
            throw ExceptionCode.TRAVEL_MOTIVATION_TYPE_COUNT_OUT_OF_RANGE_FAIL.wrap();
        }
    }

    /**
     * 여행의 동반 타입 목록을 수정합니다.
     *
     * @param companionTypes 새로운 동반 타입 목록
     * @throws FailException if companionTypes.size() not between 1 and 3
     */
    public void updateCompanionTypes(final List<CompanionType> companionTypes) {

        companions.clear();

        final List<TravelCompanion> newCompanions = companionTypes.stream()
                .map(companionType -> new TravelCompanion(this, companionType))
                .toList();

        companions.addAll(newCompanions);

        if (this.companions.isEmpty() || this.companions.size() > 3) {
            throw ExceptionCode.TRAVEL_COMPANION_TYPE_COUNT_OUT_OF_RANGE_FAIL.wrap();
        }
    }


    /**
     * 여행에서 방문할 도시 목록을 변경합니다..
     *
     * @param cities 변경하려는 도시 엔티티 목록
     * @throws FailException 도시 목록이 1개 미만 10개 초과인 경우
     */
    public void updateCities(List<City> cities) {

        if (cities.isEmpty() || cities.size() > 10) {
            throw ExceptionCode.TRAVEL_CITY_COUNT_EXCEEDED_FAIL.wrap();
        }

        this.cities.clear();

        for (City city : cities) {
            this.cities.add(new TravelCity(this, city));
        }

        this.name.regenerateDefaultName(cities());
    }

    /**
     * 지정한 여행에 새로운 일정을 추가한 뒤 순서를 할당합니다.
     *
     * @param newPlan 추가할 여행 일정
     * @param willVisitOn 방문할 날짜
     */
    public void addPlan(final TravelPlan newPlan, final LocalDate willVisitOn) {

        final int maxOrderOfPlan = plans().stream()
                .filter(plan -> plan.getWillVisitOn().equals(willVisitOn))
                .mapToInt(TravelPlan::getOrderOfPlan)
                .max().orElse(0);

        newPlan.setTravel(this);

        newPlan.updateOrder(willVisitOn, maxOrderOfPlan + 1);
        plans().add(newPlan);
    }

    /**
     * 여행 일정을 이동한 후, 순서가 같거나 큰 일정들의 순서를 뒤로 밉니다.
     *
     * @param travelPlan 이동할 계획 엔티티
     */
    public void pushBackBehindPlans(final TravelPlan travelPlan) {

        final LocalDate willVisitOn = travelPlan.getWillVisitOn();
        final Integer orderOfPlan = travelPlan.getOrderOfPlan();

        final List<TravelPlan> targetPlans = plans().stream()
                .filter(otherPlan -> otherPlan.getWillVisitOn().isEqual(willVisitOn))
                .filter(otherPlan -> otherPlan.getOrderOfPlan() >= orderOfPlan)
                .filter(otherPlan -> !otherPlan.equals(travelPlan))
                .toList();

        int newOrderOfPlan = orderOfPlan + 1;

        for (TravelPlan targetPlan : targetPlans) {
            targetPlan.updateOrder(willVisitOn, newOrderOfPlan ++);
        }
    }


    /**
     * 지정된 여행 계획을 삭제합니다.
     *
     * @param travelPlan 삭제할 여행 계획
     */
    public void deletePlan(TravelPlan travelPlan) {

        // 여행 계획을 삭제
        if (!plans.contains(travelPlan)) {
            throw ExceptionCode.ENTITY_NOT_FOUND_FAIL.wrap();
        }

        plans.remove(travelPlan);
    }


}
