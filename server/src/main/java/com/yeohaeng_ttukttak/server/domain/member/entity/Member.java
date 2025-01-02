package com.yeohaeng_ttukttak.server.domain.member.entity;

import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.nickname.Nickname;
import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuth;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.NaturalId;

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

    @Column(nullable = false, unique = true, updatable = false)
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

    @NotNull
    @OneToOne(mappedBy = "member", cascade = CascadeType.ALL)
    private Avatar avatar;

    public Member(OAuth auth, Nickname nickname, Gender gender, LocalDate birthDate) {
        this.auth = auth;
        this.uuid = StringUtil.createShortUUID();
        this.nickname = nickname.value();
        this.gender = gender;
        this.ageGroup = AgeGroup.fromBrithDate(birthDate);
        this.avatar = new DefaultAvatar(this);
    }

    public Long id() { return id; }

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

    public Avatar avatar() {
        return avatar;
    }

    /**
     * 사용자 프로필 내용을 변경한다. 변경할 속성을 null이 아닌 값으로 설정한다.
     * @param nickname 변경할 닉네임 값
     * @param gender 변경할 성별 값
     * @param ageGroup 변경할 연령대 값
     */
    public void updateProfile(Nickname nickname, Gender gender, AgeGroup ageGroup) {
        if (nickname != null) {
            this.nickname = nickname.value();
        }

        if (gender != null) {
            this.gender = gender;
        }

        if (ageGroup != null) {
            this.ageGroup = ageGroup;
        }
    }

}
