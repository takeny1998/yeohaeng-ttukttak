package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeniedFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import com.yeohaeng_ttukttak.server.domain.shared.entity.CompanionType;
import com.yeohaeng_ttukttak.server.domain.shared.entity.MotivationType;
import com.yeohaeng_ttukttak.server.domain.travel.exception.AlreadyJoinedTravelFailException;
import com.yeohaeng_ttukttak.server.domain.travel.exception.CityAlreadyAddedTravelFailException;
import com.yeohaeng_ttukttak.server.domain.travel.exception.TooManyTravelCityFailException;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelName;
import com.yeohaeng_ttukttak.server.domain.travel_plan.TravelPlan;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Travel extends BaseTimeMemberEntity {

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

    public Travel(TravelName name, TravelDates dates) {
        this.name = name;
        this.dates = dates;
    }

    public Long id() {
        return id;
    }

    public String name() {
        return name.name();
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
     * 해당 여행 객체에 쓰기 권한이 있는지 검사한다.
     * @param memberId 접근하려는 자의 식별자
     * @throws AccessDeniedFailException 권한이 없는 경우
     */
    public void verifyModifyGrant(String memberId) {
        final boolean isOwner = Objects.equals(createdBy().uuid(), memberId);

        final boolean isParticipant = participants.stream()
                .anyMatch(e -> e.invitee().uuid().equals(memberId));

        if (!(isOwner || isParticipant)) {
            throw new AccessDeniedFailException(Travel.class);
        }
    }

    /**
     * 여행 여행 객체를 삭제할 수 있는지 검사한다.
     * @param memberId 접근자의 식별값
     * @throws AccessDeniedFailException 권한이 없는 경우
     */
    public void verifyCreator(String memberId) {
        final boolean isCreator =
                Objects.equals(createdBy().uuid(), memberId);

        if (!isCreator) {
            throw new AccessDeniedFailException(Travel.class);
        }
    }


    /**
     * 현재 여행 계획에 지정한 도시를 추가합니다.
     * @param memberId 사용자의 식별자
     * @param city 추가하려는 도시 엔티티
     * @throws AccessDeniedFailException 여행에 참가자 혹은 생성자가 아니면 발생한다.
     * @throws CityAlreadyAddedTravelFailException 이미 여행에 추가된 경우 발생한다.
     */
    public void addCity(String memberId, City city) {
        verifyModifyGrant(memberId);

        final boolean isAlreadyExist = cities().stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (isAlreadyExist) {
            throw new CityAlreadyAddedTravelFailException();
        }

        cities().add(new TravelCity(this, city));
    }

    public void addMotivation(MotivationType motivationType) {
        final boolean isAlreadyExist = motivations().stream()
                .anyMatch(tm -> tm.type().equals(motivationType));

        if (isAlreadyExist) return;

        motivations().add(new TravelMotivation(this, motivationType));
    }

    public void addCompanion(CompanionType companionType) {
        final boolean isAlreadyExist = companions().stream()
                .anyMatch(tc -> tc.type().equals(companionType));

        if (isAlreadyExist) return;

        companions().add(new TravelCompanion(this, companionType));
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
        verifyModifyGrant(member.uuid());

        final boolean isInvitedByKicker = Objects.equals(member.uuid(), participant.invitee().uuid());
        final boolean isMemberOwner = Objects.equals(member.uuid(), createdBy().uuid());

        if (!isInvitedByKicker && !isMemberOwner) {
            throw new AccessDeniedFailException(TravelParticipant.class);
        }

        participants.remove(participant);
    }


    public void addPlan(
//            String memberId,
                        Place place, Integer dayOfTravel) {
//
//        final long totalDays = LocalDateUtil.getBetweenDays(startedOn, endedOn);
//
//        if (dayOfTravel < 0 || dayOfTravel >= totalDays) {
//            throw new ArgumentNotInRangeFailException("dayOfTravel", 0, totalDays);
//        }
//
//        verifyModifyGrant(memberId);

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

    public void movePlan(Long visitId, Integer dayOfTravel, Integer orderOfVisit) {
        final TravelPlan insertVisit = plans().stream()
                .filter((visit -> Objects.equals(visit.id(), visitId)))
                .findFirst()
                .orElseThrow(() -> new EntityNotFoundFailException(TravelPlan.class));

        plans().remove(insertVisit);

        for (TravelPlan visit : plans()) {
            if (!Objects.equals(visit.dayOfTravel(), dayOfTravel)) continue;
            if (visit.orderOfPlan() >= orderOfVisit) {
                visit.setOrderOfPlan(visit.orderOfPlan() + 1);
            }
        }

        insertVisit.setOrderOfPlan(orderOfVisit)
                .setDayOfTravel(dayOfTravel);

        plans().add(insertVisit);

    }

    public void removeVisit(Long visitId) {
        plans().removeIf(visit -> visit.id().equals(visitId));
    }

}
