package com.yeohaeng_ttukttak.server.domain.geography.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.ToString;

@Entity
@DiscriminatorValue("2")
@ToString
public class City extends Geography {

    public Province province() {
        return (Province) super.parent();
    }
}
