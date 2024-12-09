package com.yeohaeng_ttukttak.server.domain.member.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
public abstract class Avatar {

    @Id @GeneratedValue
    private Long id;

    @OneToOne
    @JoinColumn(name = "member_id")
    private Member member;

    abstract public String path();

    abstract public String ext();

    protected Avatar(Member member) {
        this.member = member;
    }

    protected Member member() {
        return member;
    }

}
