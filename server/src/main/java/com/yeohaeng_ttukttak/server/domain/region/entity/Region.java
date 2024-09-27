package com.yeohaeng_ttukttak.server.domain.region.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

import static jakarta.persistence.InheritanceType.SINGLE_TABLE;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@DiscriminatorColumn(name = "level", discriminatorType = DiscriminatorType.INTEGER)
@Inheritance(strategy = SINGLE_TABLE)
public abstract class Region {

    @Id
    private Long id;

    @Column(insertable=false, updatable=false)
    private int level;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Region parent;

    @OneToMany(mappedBy = "parent")
    private List<Region> children = new ArrayList<>();

    public Long id() {
        return id;
    }

    public int level() {
        return level;
    }

    public List<Region> children() {
        return children;
    }
}

