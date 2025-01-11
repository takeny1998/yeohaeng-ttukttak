package com.yeohaeng_ttukttak.server.domain.geography.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("0")
public class Country extends Geography { }
