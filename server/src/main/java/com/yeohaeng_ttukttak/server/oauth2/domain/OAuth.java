package com.yeohaeng_ttukttak.server.oauth2.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;

import static jakarta.persistence.GenerationType.IDENTITY;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
public class OAuth {

    @Id @GeneratedValue(strategy = IDENTITY)
    private Long id;

    @NotNull @Column(unique = true, updatable = false)
    private String openId;

    private OAuthProvider provider;

    public OAuth(String openId, OAuthProvider provider) {
        this.openId = openId;
        this.provider = provider;
    }

}
