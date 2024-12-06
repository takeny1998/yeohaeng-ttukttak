package com.yeohaeng_ttukttak.server.domain.locale;

import java.util.List;
import java.util.Locale;

public interface LocalizedMessagesProvider {

    List<String> get(Locale locale);

}
