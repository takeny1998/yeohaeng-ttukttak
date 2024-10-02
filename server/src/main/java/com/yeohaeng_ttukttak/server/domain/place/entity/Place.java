package com.yeohaeng_ttukttak.server.domain.place.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.ToString;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
@NoArgsConstructor(access = PROTECTED)
public final class Place {

    @Id
    private Long id;

    @NotNull
    @Column(unique = true, insertable = false, updatable = false)
    private String poiId;

    private String name;

    private Integer regionCode;

    private String lotNumberAddress;

    private String roadAddress;

    private Double longitude;

    private Double latitude;

}
