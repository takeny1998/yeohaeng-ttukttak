package com.yeohaeng_ttukttak.server.domain.member.entity;

import com.yeohaeng_ttukttak.server.domain.oauth.entity.OAuth;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.UUID;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
@NoArgsConstructor(access = PROTECTED)
public class Member {

    @Id @GeneratedValue
    private UUID id;

    private Gender gender;

    private LocalDate birthDate;

    @NotNull
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "auth_id", updatable = false)
    private OAuth auth;

    public Member(OAuth auth, Gender gender, LocalDate birthDate) {
        this.auth = auth;
        this.gender = gender;
        this.birthDate = birthDate;
    }

    public String id() {
        return id.toString();
    }
}
