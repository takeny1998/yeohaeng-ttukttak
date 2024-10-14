package com.yeohaeng_ttukttak.server.domain.image.entity;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class TravelVisitImage extends Image {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "visit_id")
    private TravelVisit visit;


    @Override
    public Long targetId() {
        return visit.id();
    }
}
