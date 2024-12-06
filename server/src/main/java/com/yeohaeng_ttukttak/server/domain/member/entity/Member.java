package com.yeohaeng_ttukttak.server.domain.member.entity;

import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuth;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.time.Period;
import java.util.Objects;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
@NoArgsConstructor(access = PROTECTED)
public class Member {

    @Id @GeneratedValue
    private Long id;

    @NotNull
    @Column(unique = true, updatable = false)
    private String uuid;

    @Enumerated(EnumType.STRING)
    private AgeGroup ageGroup;

    @NotNull
    private String nickname;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @NotNull
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "auth_id", updatable = false)
    private OAuth auth;

    public Member(OAuth auth, String nickname, Gender gender, LocalDate birthDate) {
        this.auth = auth;
        this.uuid = StringUtil.createShortUUID();
        this.nickname = nickname;
        this.gender = gender;
        this.ageGroup = AgeGroup.fromBrithDate(birthDate);
    }

    public String uuid() {
        return uuid;
    }

    public AgeGroup ageGroup() {
        return ageGroup;
    }

    public Gender gender() {
        return gender;
    }

    public String nickname() {
        return nickname;
    }

}
