package com.yeohaeng_ttukttak.server.domain.geography.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("1")
public class Province extends Geography { }
