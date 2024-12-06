package com.yeohaeng_ttukttak.server.domain.nickname;

import lombok.EqualsAndHashCode;

@EqualsAndHashCode
public final class Nickname {

    private final String value;

    Nickname(String value) {
        this.value = value;
    }

    public String value() {
        return value;
    }

}
