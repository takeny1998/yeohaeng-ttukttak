package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelPlanComment extends Comment {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "plan_id")
    private TravelPlan plan;

    public TravelPlanComment(final TravelPlan plan, String content) {
        super(content);
        this.plan = plan;
    }

    @Override
    protected int getContentByteLimit() {
        return 100;
    }

}
