package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
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

    @NotNull
    private String content;

    TravelPlanComment(TravelPlan plan, String content) {
        final int byteLength = StringUtil.getByteLengthInEucKr(content);
        if (byteLength > 100) {
            throw new CommentContentLengthTooLongFailException();
        }

        this.plan = plan;
        this.content = content;
    }

    Long id() {
        return id;
    }

    TravelPlan plan() {
        return plan;
    }

    String content() {
        return content;
    }

}
