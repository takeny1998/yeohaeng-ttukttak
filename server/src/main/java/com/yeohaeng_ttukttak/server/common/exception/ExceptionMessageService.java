package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.locale.RequestLocaleService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.stereotype.Service;

import java.text.MessageFormat;
import java.util.Locale;

@Service
@RequiredArgsConstructor
public final class ExceptionMessageService {

    private final RequestLocaleService requestLocaleService;

    private final MessageSource messageSource;


    public String getMessage(final BaseException exception) {
        return getMessage(exception, requestLocaleService.getCurrentLocale());
    }

    public String getMessage(final BaseException exception, final Locale locale) {

        final String localizedMessage =
                localizeBaseMessage(locale, exception.getBaseMessage());

        return MessageFormat.format(localizedMessage, exception.getArguments(locale));

    }

    /**
     * 주어진 로케일 정보에 맞는 메세지를 반환합니다.
     *
     * @param locale 로케일 정보
     * @param message 번역할 메세지
     * @return 영어 혹은 한국어로 번역된 메세지; 메세지를 찾지 못한 경우 영문 메세지를 반환합니다.
     */
    private String localizeBaseMessage(final Locale locale, final String message) {

        final boolean isEnglish = locale
                .getLanguage()
                .equalsIgnoreCase("en");

        if (isEnglish) return message;

        try {
            return messageSource.getMessage(message, null, locale);
        } catch (NoSuchMessageException ex) {
            return message;
        }

    }

}
