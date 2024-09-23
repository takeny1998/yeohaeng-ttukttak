package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import jakarta.persistence.*;

@Entity
@DiscriminatorValue("Input")
public final class InputTravel extends Travel {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    public void setMember(Member member) {
        this.member = member;
    }

    @Override
    AgeGroup ageGroup() {
        return member.ageGroup();
    }

}
