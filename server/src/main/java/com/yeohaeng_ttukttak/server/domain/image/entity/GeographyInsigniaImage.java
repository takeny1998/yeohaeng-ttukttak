package com.yeohaeng_ttukttak.server.domain.image.entity;

import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import jakarta.persistence.*;

@Entity
public final class GeographyInsigniaImage extends Image {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "geography_id")
    private Geography geography;

    @Override
    public Long targetId() {
        return geography.id();
    }

}
