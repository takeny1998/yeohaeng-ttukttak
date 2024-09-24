package com.yeohaeng_ttukttak.server.domain.place.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

import static jakarta.persistence.InheritanceType.SINGLE_TABLE;
import static lombok.AccessLevel.PROTECTED;

@ToString
@Entity
@NoArgsConstructor(access = PROTECTED)
@DiscriminatorColumn
@Inheritance(strategy = SINGLE_TABLE)
public abstract class Region {

    @Id
    private Long id;

    @NotNull
    private int code;

    @NotNull
    private String name;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Region parent;

    @OneToMany(mappedBy = "parent")
    private List<Region> children = new ArrayList<>();

}

