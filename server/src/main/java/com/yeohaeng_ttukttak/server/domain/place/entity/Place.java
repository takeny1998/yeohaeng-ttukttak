package com.yeohaeng_ttukttak.server.domain.place.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.NoArgsConstructor;
import lombok.ToString;

import static lombok.AccessLevel.PROTECTED;

@Entity
@ToString
@NoArgsConstructor(access = PROTECTED)
public final class Place {

    @Id
    private Long id;

    private String name;

    private Integer regionCode;

    private String lotNumberAddress;

    private String roadAddress;

    private Double longitude;

    private Double latitude;



}
