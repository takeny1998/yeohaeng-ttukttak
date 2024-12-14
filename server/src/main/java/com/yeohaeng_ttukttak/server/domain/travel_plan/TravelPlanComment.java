package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.AccessDeinedFailException;
import com.yeohaeng_ttukttak.server.domain.comment.Comment;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelPlanComment {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "plan_id")
    private TravelPlan plan;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "comment_id")
    private Comment comment;

    /**
     * 여행 계획에 새 댓글을 추가한다.
     * @param plan 댓글을 추가할 여행 계획 대상
     * @param comment 작성할 댓글 엔티티
     * @throws AccessDeinedFailException 댓글을 추가할 권한이 없는 경우 발생한다.
     */
    public TravelPlanComment(TravelPlan plan, Comment comment) {
        this.plan = plan;
        this.comment = comment;
    }

    Long id() {
        return id;
    }

    public TravelPlan plan() {
        return plan;
    }

    public Comment comment() {
        return comment;
    }

}
