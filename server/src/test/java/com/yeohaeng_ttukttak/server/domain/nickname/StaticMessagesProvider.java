package com.yeohaeng_ttukttak.server.domain.nickname;

import com.yeohaeng_ttukttak.server.domain.locale.LocalizedMessagesProvider;

import java.util.List;
import java.util.Locale;

public final class StaticMessagesProvider implements LocalizedMessagesProvider {

    private final List<String> messages;

    StaticMessagesProvider(List<String> messages) {
        this.messages = messages;
    }

    StaticMessagesProvider() {
        this.messages = List.of();
    }

    @Override
    public List<String> get(Locale locale) {
        return null;
    }
}
