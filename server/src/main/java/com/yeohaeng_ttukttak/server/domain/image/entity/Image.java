package com.yeohaeng_ttukttak.server.domain.image.entity;

import jakarta.persistence.*;

@MappedSuperclass
public abstract class Image {

    @Id
    private Long id;

    private String name;

    private String ext;

    private String path;

    public abstract Long targetId();

    public Long id() {
        return id;
    }

    public String name() {
        return name;
    }

    public String ext() {
        return ext;
    }

    public String path() {
        return path;
    }
}
