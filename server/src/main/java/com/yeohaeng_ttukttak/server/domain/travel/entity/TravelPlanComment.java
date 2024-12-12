package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeEntity;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelPlanComment extends BaseTimeMemberEntity {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "plan_id")
    private TravelPlan plan;

    TravelPlanComment(TravelPlan plan) {
        this.plan = plan;
    }

}
