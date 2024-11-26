package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.travel.exception.AlreadyJoinedTravelErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.error.ForbiddenErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public final class MemberTravel extends Travel {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    @OneToMany(mappedBy = "travel", cascade = { CascadeType.PERSIST, CascadeType.MERGE }, orphanRemoval = true)
    private List<TravelParticipant> participants = new ArrayList<>();

    public MemberTravel(Member member, LocalDate startedOn, LocalDate endedOn) {
        super(startedOn, endedOn);
        this.member = member;
    }

    @Override
    public AgeGroup ageGroup() {
        return member.ageGroup();
    }

    @Override
    public Gender gender() {
        return member.gender();
    }

    public Member member() {
        return member;
    }

    /**
     * 해당 여행 객체에 쓰기 권한이 있는지 검사한다.
     * @param memberId 접근하려는 자의 식별자
     * @throws ForbiddenErrorException 권한이 없는 경우
     */
    public void verifyWriteGrant(String memberId) {
        final boolean isOwner = Objects.equals(member.id(), memberId);

        final boolean isParticipant = participants.stream()
                .anyMatch(e -> e.member().id().equals(memberId));

        if (!(isOwner || isParticipant)) {
            throw new ForbiddenErrorException(Travel.class);
        }
    }

    /**
     * 여행 여행 객체를 삭제할 수 있는지 검사한다.
     * @param memberId 접근자의 식별값
     * @throws ForbiddenErrorException 권한이 없는 경우
     */
    public void verifyDeleteGrant(String memberId) {
        final boolean isOwner = Objects.equals(member.id(), memberId);

        if (!isOwner) {
            throw new ForbiddenErrorException(Travel.class);
        }
    }

    public void addCity(City city) {
        final boolean isAlreadyExist = cities().stream()
                .anyMatch(tc -> tc.city().equals(city));

        if (isAlreadyExist) return;

        cities().add(new TravelCity(this, city));
    }

    public void addMotivation(TravelMotivationType travelMotivationType) {
        final boolean isAlreadyExist = motivations().stream()
                .anyMatch(tm -> tm.type().equals(travelMotivationType));

        if (isAlreadyExist) return;

        motivations().add(new TravelMotivation(this, travelMotivationType));
    }

    public void addCompanion(TravelCompanionType travelCompanionType) {
        final boolean isAlreadyExist = companions().stream()
                .anyMatch(tc -> tc.type().equals(travelCompanionType));

        if (isAlreadyExist) return;

        companions().add(new TravelCompanion(this, travelCompanionType));
    }

    /**
     * 지정된 사용자를 해당 여행에 참여자로 추가한다.
     * @param member 초대할 사용자 객체
     * @throws AlreadyJoinedTravelErrorException 이미 참여한 사용자일 때 발생한다.
     */
    public void addParticipant(Member member) {
        final boolean isAlreadyExist = participants.stream()
                .anyMatch(participant -> participant.member().equals(member));

        if (isAlreadyExist || Objects.equals(member, this.member)) {
            throw new AlreadyJoinedTravelErrorException();
        }

        participants.add(new TravelParticipant(this, member));
    }

    public void addVisit(Place place, Integer dayOfTravel) {
        int orderOfVisit = -1;

        for (TravelVisit visit : visits()) {
            if (Objects.equals(visit.dayOfTravel(), dayOfTravel)) {
                orderOfVisit = Math.max(orderOfVisit, visit.orderOfVisit());
            }
        }

        visits().add(new TravelVisit(dayOfTravel, orderOfVisit + 1, place, this));
    }

    public void moveVisit(Long visitId, Integer dayOfTravel, Integer orderOfVisit) {

        final TravelVisit insertVisit = visits().stream()
                .filter((visit -> Objects.equals(visit.id(), visitId)))
                .findFirst()
                .orElseThrow(() -> new EntityNotFoundFailException(TravelVisit.class));

        visits().remove(insertVisit);

        for (TravelVisit visit : visits()) {
            if (!Objects.equals(visit.dayOfTravel(), dayOfTravel)) continue;
            if (visit.orderOfVisit() >= orderOfVisit) {
                visit.setOrderOfVisit(visit.orderOfVisit() + 1);
            }
        }

        insertVisit.setOrderOfVisit(orderOfVisit)
                        .setDayOfTravel(dayOfTravel);

        visits().add(insertVisit);

    }

    public void removeVisit(Long visitId) {
        visits().removeIf(visit -> visit.id().equals(visitId));
    }

}
