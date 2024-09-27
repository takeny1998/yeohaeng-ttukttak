package com.yeohaeng_ttukttak.server.domain.region.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("0")
public final class State extends Region { }
