package com.yeohaeng_ttukttak.server.common.locale;

import java.util.Locale;

public interface RequestLocaleService {

    /**
     * 현재 요청의 로케일(Locale) 객체를 반환합니다.
     *
     * @return 현재 요청의 로케일(Locale) 객체
     */
    Locale getCurrentLocale();

}
