package com.yeohaeng_ttukttak.server.common.config;

import com.yeohaeng_ttukttak.server.domain.locale.LocalizedMessagesProvider;

import java.util.List;

public interface ResourceConfigurable {

    List<String> fWords();

    LocalizedMessagesProvider adjectivesProvider();

    LocalizedMessagesProvider animalsProvider();

}
