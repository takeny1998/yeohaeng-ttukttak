package com.yeohaeng_ttukttak.server.sample;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.NoArgsConstructor;

import static lombok.AccessLevel.PROTECTED;

@Entity
@Getter
@NoArgsConstructor(access = PROTECTED)
public class SampleEntity {

    @Id @GeneratedValue
    private Long id;

    private String name;

    public SampleEntity(String name) {
        this.name = name;
    }

}
