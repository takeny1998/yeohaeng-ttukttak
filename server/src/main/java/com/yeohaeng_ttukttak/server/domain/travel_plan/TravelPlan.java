package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.ForbiddenErrorException;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Entity
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelPlan {

    @Id @GeneratedValue
    private Long id;

    @NotNull
    private Integer dayOfTravel;

    @NotNull
    private Integer orderOfPlan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "place_id")
    private Place place;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "travel_id")
    private Travel travel;

    @OneToMany(mappedBy = "plan", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    @OrderBy("createdAt DESC, lastModifiedAt DESC, id ASC")
    private List<TravelPlanComment> comments = new ArrayList<>();

    public TravelPlan(Integer dayOfTravel, Integer orderOfPlan, Place place, Travel travel) {
        this.dayOfTravel = dayOfTravel;
        this.orderOfPlan = orderOfPlan;
        this.place = place;
        this.travel = travel;
    }

    public TravelPlan setDayOfTravel(Integer dayOfTravel) {
        this.dayOfTravel = dayOfTravel;
        return this;
    }

    public TravelPlan setOrderOfPlan(Integer orderOfVisit) {
        this.orderOfPlan = orderOfVisit;
        return this;
    }

    public Long id() {
        return id;
    }

    public Place place() {
        return place;
    }

    public Travel travel() {
        return travel;
    }

    public Integer dayOfTravel() {
        return dayOfTravel;
    }

    public Integer orderOfPlan() {
        return orderOfPlan;
    }

    /**
     * 여행 계획에 새 댓글을 추가한다.
     * @param writerId 추가할 사용자의 식별자
     * @param content 댓글의 내용
     * @throws ForbiddenErrorException 댓글을 추가할 권한이 없는 경우 발생한다.
     */
    public void writeComment(String writerId, String content) {
        travel.verifyModifyGrant(writerId);
        comments.add(new TravelPlanComment(this, content));
    }

    public List<TravelPlanComment> getOrderedComments() {
        return comments;
    }

}
