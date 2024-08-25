package com.yeohaeng_ttukttak.server.user.domain;

import com.yeohaeng_ttukttak.server.common.entity.TimeAuditableEntity;
import com.yeohaeng_ttukttak.server.user.domain.auth.OAuth;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

import static jakarta.persistence.GenerationType.IDENTITY;
import static lombok.AccessLevel.PROTECTED;

@Getter
@Entity
@Table(name = "users")
@NoArgsConstructor(access = PROTECTED)
@ToString(of = {"id", "nickname", "gender", "birthday"})
public class User extends TimeAuditableEntity {

    @Id @GeneratedValue(strategy = IDENTITY)
    private Long id;

    private String nickname;

    private Gender gender;

    private LocalDate birthday;

    @NotNull @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "auth_id", updatable = false)
    private OAuth auth;

    public User(OAuth auth, String nickname, Gender gender, LocalDate birthday) {
        this.nickname = nickname;
        this.gender = gender;
        this.birthday = birthday;
        this.auth = auth;
    }
}
