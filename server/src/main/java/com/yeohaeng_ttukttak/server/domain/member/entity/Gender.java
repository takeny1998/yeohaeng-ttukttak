package com.yeohaeng_ttukttak.server.domain.member.entity;

import com.yeohaeng_ttukttak.server.domain.shared.interfaces.EnumNormalizable;

public enum Gender implements EnumNormalizable {
    male, female;

    public double normalize() {
        return switch (this) {
            case male -> 1.0;
            case female -> 0.0;
        };
    }

}
