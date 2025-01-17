package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.authorization.CrudOperation;
import com.yeohaeng_ttukttak.server.common.authorization.Authorization;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.*;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Authorizable;
import com.yeohaeng_ttukttak.server.domain.travel.exception.*;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
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
public class Travel extends BaseTimeMemberEntity implements Authorizable {

    @Id @GeneratedValue
    private Long id;

    @Embedded
    private TravelName name;

    @Embedded
    private TravelDates dates;

    @OneToMany(mappedBy = "travel", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelCity> cities = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelCompanion> companions = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelMotivation> motivations = new ArrayList<>();

    @OrderBy("dayOfTravel ASC nulls last, orderOfPlan ASC nulls last")
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
    @Authorization(requires = CrudOperation.CREATE)
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
    @Authorization(requires = CrudOperation.UPDATE)
    public void rename(final String inputName) {
        this.name.updateName(inputName);
    }


    /**
     * @see TravelDates#updateDates(LocalDate, LocalDate)
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void updateDates(final LocalDate startedOn, final LocalDate endedOn) {
        this.dates.updateDates(startedOn, endedOn);
    }

    /**
     * 여행의 동기 목록을 수정합니다.
     *
     * @param motivationTypes 새로운 여행 동기 목록
     * @throws InvalidTravelMotivationSizeFailException if motivationTypes.size() not between 1 and 5
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void updateMotivationsTypes(final List<MotivationType> motivationTypes) {

        motivations.clear();

        final List<TravelMotivation> newMotivations = motivationTypes
                .stream()
                .map(motivationType -> new TravelMotivation(this, motivationType))
                .toList();

        motivations.addAll(newMotivations);

        if (this.motivations.isEmpty() || this.motivations.size() > 5) {
            throw new InvalidTravelMotivationSizeFailException();
        }
    }

    /**
     * 여행의 동반 타입 목록을 수정합니다.
     *
     * @param companionTypes 새로운 동반 타입 목록
     * @throws InvalidTravelCompanionSizeFailException if companionTypes.size() not between 1 and 3
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void updateCompanionTypes(final List<CompanionType> companionTypes) {

        companions.clear();

        final List<TravelCompanion> newCompanions = companionTypes.stream()
                .map(companionType -> new TravelCompanion(this, companionType))
                .toList();

        companions.addAll(newCompanions);

        if (this.companions.isEmpty() || this.companions.size() > 3) {
            throw new InvalidTravelCompanionSizeFailException();
        }
    }


    /**
     * 여행에서 방문할 도시 목록을 변경합니다..
     *
     * @param cities 변경하려는 도시 엔티티 목록
     * @throws InvalidTravelCitySizeFailException 도시 목록이 1개 미만 10개 초과인 경우
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void updateCities(List<City> cities) {

        if (cities.isEmpty() || cities.size() > 10) {
            throw new InvalidTravelCitySizeFailException();
        }

        this.cities.clear();

        for (City city : cities) {
            this.cities.add(new TravelCity(this, city));
        }

        this.name.regenerateDefaultName(cities());
    }

    /**
     * 지정된 사용자를 해당 여행에 참여자로 추가한다.
     * @param inviter 해당 사용자를 초대한 자
     * @param invitee 여행에 참여할 사용자
     * @throws AlreadyJoinedTravelFailException 이미 참여한 사용자일 때 발생한다.
     */
    public void joinParticipant(Member inviter, Member invitee) {
        final boolean isInviteeParticipated = participants.stream()
                .anyMatch(participant -> participant.invitee().equals(invitee));

        final boolean isOwnerInvited = Objects.equals(invitee.uuid(), createdBy().uuid());

        if (isInviteeParticipated || isOwnerInvited) {
            throw new AlreadyJoinedTravelFailException("inviteeId");
        }

        participants.add(new TravelParticipant(this, invitee, inviter));
    }

    /**
     * 지정된 참여자를 해당 여행에서 쫒아(kick)낸다.
     * @param member 쫒아낼 사용자
     * @param participant 쫒을 대상 참여자의 식별자
     * @throws AccessDeniedFailException 대상 참여자를 쫒을 권한이 없는 경우 발생한다.
     */
    public void leaveParticipant(Member member, TravelParticipant participant) {
        final boolean isInvitedByKicker = Objects.equals(member.uuid(), participant.invitee().uuid());
        final boolean isMemberOwner = Objects.equals(member.uuid(), createdBy().uuid());

        if (!isInvitedByKicker && !isMemberOwner) {
            throw new AccessDeniedFailException(TravelParticipant.class);
        }

        participants.remove(participant);
    }

    /**
     * 지정한 여행에 새로운 계획을 생성합니다.
     *
     * @param place 계획에 지정할 장소(Place) 엔티티
     * @param dayOfTravel 계획을 수행할 일자
     * @throws ArgumentNotInRangeFailException 여행 기간에 벗어나는 일자를 지정했을 경우 발생한다.
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void addPlan(Place place, Integer dayOfTravel) {

        // 여행 날짜의 차를 구하고, 하루를 더해 총 여행 기간을 산출한다.
        final long totalTravelDays = LocalDateUtil
                .getBetweenDays(startedOn(), endedOn());

        if (dayOfTravel < 0 || dayOfTravel >= totalTravelDays) {
            throw new ArgumentNotInRangeFailException("dayOfTravel", 0, totalTravelDays);
        }

        int orderOfPlan = -1;

        for (TravelPlan plan : plans) {
            if (Objects.equals(plan.dayOfTravel(), dayOfTravel)) {
                orderOfPlan = Math.max(orderOfPlan, plan.orderOfPlan());
            }
        }

        final TravelPlan plan = new TravelPlan(
                dayOfTravel, orderOfPlan + 1, place, this);

        plans.add(plan);
    }
    /**
     * 여행 계획을 이동합니다.
     *
     * @param travelPlan 이동할 계획 엔티티
     * @param newOrderOfPlan 새로운 계획의 순서
     * @param willVisitOn 방문할 예정일
     * @throws AccessDeniedFailException 사용자가 변경 권한이 없는 경우 발생합니다.
     * @throws ArgumentNotInRangeFailException 지정된 방문일이 여행 기간에 벗어나는 경우 발생합니다.
     * @throws EntityNotFoundFailException 주어진 ID에 해당하는 여행 계획이 존재하지 않는 경우 발생합니다.
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void movePlan(TravelPlan travelPlan, Integer newOrderOfPlan, LocalDate willVisitOn) {

        // 지정된 방문일이 여행 기간 내에 있는지 검증
        if (!LocalDateUtil.isInRange(willVisitOn, dates.startedOn(), dates.endedOn())) {
            throw new ArgumentNotInRangeFailException("willVisitOn", dates.startedOn(), dates.endedOn());
        }

        // 방문일에 대한 여행 일수 계산
        final int newDayOfTravel =
                (int) LocalDateUtil.getBetweenDays(dates.startedOn(), willVisitOn) - 1;

        for (TravelPlan plan : plans) {
            if (Objects.equals(plan.id(), travelPlan.id())) {
                travelPlan.setOrderOfPlan(newOrderOfPlan)
                        .setDayOfTravel(newDayOfTravel);
                continue;
            }

            final boolean isInSameDay = Objects.equals(plan.dayOfTravel(), newDayOfTravel);

            final Integer orderOfPlan = plan.orderOfPlan();

            if (isInSameDay && orderOfPlan >= newOrderOfPlan) {
                plan.setOrderOfPlan(orderOfPlan + 1);
            }
        }
    }


    /**
     * 지정된 여행 계획을 삭제합니다.
     *
     * @param travelPlan 삭제할 여행 계획
     * @throws AccessDeniedFailException 사용자가 여행 계획의 참여자 또는 생성자가 아닌 경우 발생합니다.
     * @throws EntityNotFoundFailException 주어진 여행 계획이 존재하지 않는 경우 발생합니다.
     */
    @Authorization(requires = CrudOperation.UPDATE)
    public void deletePlan(TravelPlan travelPlan) {

        // 여행 계획을 삭제
        if (!plans.contains(travelPlan)) {
            throw new EntityNotFoundFailException(TravelPlan.class);
        }

        plans.remove(travelPlan);
    }


}
