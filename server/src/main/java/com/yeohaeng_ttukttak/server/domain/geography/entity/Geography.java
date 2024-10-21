package com.yeohaeng_ttukttak.server.domain.geography.entity;

import com.yeohaeng_ttukttak.server.common.util.LocaleUtil;
import com.yeohaeng_ttukttak.server.domain.image.entity.GeographyInsigniaImage;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static jakarta.persistence.InheritanceType.SINGLE_TABLE;
import static lombok.AccessLevel.PROTECTED;

@Entity
@NoArgsConstructor(access = PROTECTED)
@DiscriminatorColumn(name = "level", discriminatorType = DiscriminatorType.INTEGER)
@Inheritance(strategy = SINGLE_TABLE)
public abstract class Geography {

    @Id
    private Long id;

    @NotNull
    @Column(insertable=false, updatable=false)
    private int level;

    @NotNull
    @Column(insertable = false, updatable = false)
    private int code;

    private String name;

    private String nameEng;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Geography parent;

    @OneToMany(mappedBy = "parent")
    private List<Geography> children = new ArrayList<>();

    @OneToOne(mappedBy = "geography")
    private GeographyInsigniaImage insignia;

    public Long id() {
        return id;
    }

    public String name(Locale locale) {
        return LocaleUtil.find(locale, name, nameEng, nameEng);
    }

    public int level() {
        return level;
    }

    public List<Geography> children() {
        return children;
    }

    public Geography parent() {
        return parent;
    }

    public GeographyInsigniaImage insignia() {
        return insignia;
    }
}

