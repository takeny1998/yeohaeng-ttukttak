package com.yeohaeng_ttukttak.server.domain.oauth.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.ToString;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
@NoArgsConstructor(access = PROTECTED)
public class OAuth {

    @Id@GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "oauth_generator"
    )
    @SequenceGenerator(
            name = "oauth_generator",
            sequenceName = "oauth_seq",
            initialValue = 100000
    )
    private Long id;

    @NotNull
    @Column(unique = true, updatable = false)
    private String openId;

    @Enumerated(EnumType.STRING)
    private OAuthProvider provider;

    public OAuth(String openId, OAuthProvider provider) {
        this.openId = openId;
        this.provider = provider;
    }
}
