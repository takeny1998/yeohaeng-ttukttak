package com.yeohaeng_ttukttak.server.user.domain;

import com.yeohaeng_ttukttak.server.common.entity.TimeAuditableEntity;
import com.yeohaeng_ttukttak.server.oauth2.domain.OAuth;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.UUID;

import static jakarta.persistence.GenerationType.IDENTITY;
import static lombok.AccessLevel.PROTECTED;

@Getter
@Entity
@Table(name = "users")
@NoArgsConstructor(access = PROTECTED)
@AllArgsConstructor
@ToString(of = {"id", "nickname", "gender", "birthday", "auth"})
public class User extends TimeAuditableEntity {

    @Id @GeneratedValue(generator = "uuid2")
    @Column(columnDefinition = "BINARY(16)")
    private UUID id;

    private String nickname;

    @Enumerated(EnumType.STRING)
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
