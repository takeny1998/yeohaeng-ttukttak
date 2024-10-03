package com.yeohaeng_ttukttak.server.domain.geography.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.ToString;

@Entity
@DiscriminatorValue("1")
@ToString
public final class City extends Geography { }
