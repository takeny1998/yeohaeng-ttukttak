package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.aop.CrudPermission;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.*;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.shared.interfaces.Authorizable;
import com.yeohaeng_ttukttak.server.domain.travel.exception.AlreadyJoinedTravelFailException;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelName;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Slf4j
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Travel extends BaseTimeMemberEntity implements Authorizable<Travel> {

    @Id @GeneratedValue
    private Long id;

    @Embedded
    private TravelName name;

    @Embedded
    private TravelDates dates;

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    private List<TravelCity> cities = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = CascadeType.PERSIST)
    private List<TravelCompanion> companions = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<TravelMotivation> motivations = new ArrayList<>();

    @OrderBy("dayOfTravel ASC nulls last, orderOfPlan ASC nulls last")
    @OneToMany(mappedBy = "travel", cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
    private List<TravelPlan> plans = new ArrayList<>();

    @OneToMany(mappedBy = "travel", cascade = { CascadeType.PERSIST, CascadeType.MERGE }, orphanRemoval = true)
    private List<TravelParticipant> participants = new ArrayList<>();

    /**
     * 새로운 여행을 생성합니다.
     * @param dates 여행 날짜(TravelDates) 엔티티
     * @param cities 여행에서 들릴 도시 리스트
     * @param companionTypes 여행의 동반 타입 리스트
     * @param motivationTypes 여행 동기 리스트
     * @throws ArgumentNotInRangeFailException <br>
     *          if (cities.size < 1 || cities.size > 10) <br>
     *          if (companionTypes.size < 1 || companionTypes.size > 3) <br>
     *          if (motivationTypes.size < 1 || motivationTypes.size > 5)
     */
    public Travel(TravelDates dates, List<City> cities, List<CompanionType> companionTypes, List<MotivationType> motivationTypes) {
        this.dates = dates;

        if (cities.isEmpty() || cities.size() > 10) {
            throw new ArgumentNotInRangeFailException("cityIds", 1, 10);
        }

        this.cities = cities.stream()
                .map(city -> new TravelCity(this, city))
                .toList();

        if (companionTypes.isEmpty() || companionTypes.size() > 3) {
            throw new ArgumentNotInRangeFailException("companionTypes", 1, 3);
        }

        this.companions = companionTypes
                .stream()
                .map(companionType -> new TravelCompanion(this, companionType))
                .toList();


        if (motivationTypes.isEmpty() || motivationTypes.size() > 5) {
            throw new ArgumentNotInRangeFailException("motivationTypes", 1, 5);
        }

        this.motivations = motivationTypes
                .stream()
                .map(motivationType -> new TravelMotivation(this, motivationType))
                .toList();

    }

    public Long id() {
        return id;
    }

    public String name() {
        if (Objects.isNull(name)) return null;
        return name.name();
    }

    public Boolean isNameGenerated() {
        if (Objects.isNull(name)) return null;
        return name.isGenerated();
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

    @Authorization(requires = CrudPermission.UPDATE)
    public void rename(TravelName newName) {
        this.name = newName;
    }

    /**
     * 현재 여행 계획에 지정한 도시를 추가합니다.
     * @param city 추가하려는 도시 엔티티
     * @throws AccessDeniedFailException 여행에 참가자 혹은 생성자가 아니면 발생한다.
     * @throws EntityAlreadyAddedFailException 이미 여행에 추가된 경우 발생한다.
     * @throws TooManyEntityFailException 10개 초과의 여행 도시를 추가하려는 경우 발생한다.
     */
    @Authorization(requires = CrudPermission.UPDATE)
    public void addCity(City city) {

        if (cities.size() == 10) {
            throw new TooManyEntityFailException(Class.class, 10);
        }

        final boolean isAlreadyExist = cities().stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (isAlreadyExist) {
            throw new EntityAlreadyAddedFailException(City.class);
        }

        cities().add(new TravelCity(this, city));
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
     * @throws AccessDeniedFailException 여행에 참여한 사용자가 아닌 경우 발생한다.
     */
    @Authorization(requires = CrudPermission.UPDATE)
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
    @Authorization(requires = CrudPermission.UPDATE)
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
    @Authorization(requires = CrudPermission.UPDATE)
    public void deletePlan(TravelPlan travelPlan) {

        // 여행 계획을 삭제
        if (!plans.contains(travelPlan)) {
            throw new EntityNotFoundFailException(TravelPlan.class);
        }

        plans.remove(travelPlan);
    }

    @Override
    public Travel resolve() {
        return this;
    }
}
