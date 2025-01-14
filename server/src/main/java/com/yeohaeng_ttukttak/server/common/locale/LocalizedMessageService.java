package com.yeohaeng_ttukttak.server.common.locale;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;

import java.util.Locale;

public interface LocalizedMessageService {

    /**
     * 예외 객체를 현재 요청에 맞는 다국어 메세지로 번역합니다.
     *
     * @param locale 로케일 정보
     * @param exception 예외 객체
     * @return 번역된 메세열
     * @param <T> BaseException을 상속한 예외 타입
     */
    <T extends BaseException> String fromException(final Locale locale, final T exception);


}
