package com.yeohaeng_ttukttak.server.common.exception.exception;

import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.common.locale.RequestLocaleService;
import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;

import java.text.MessageFormat;
import java.util.Locale;

@Configurable(autowire = Autowire.BY_TYPE)
public abstract class BaseException extends RuntimeException {

    @Autowired
    protected RequestLocaleService requestLocaleService;

    @Autowired
    protected MessageSource messageSource;

    protected BaseException(@Nullable Throwable cause) {
        super(cause);
    }

    protected BaseException() {
        this(null);
    }

    public final String getMessage() {
        return getMessage(requestLocaleService.getCurrentLocale());
    }

    public String getMessage(@Nonnull final Locale locale) {

        final String localizedMessage =
                localizeBaseMessage(locale, getBaseMessage());

        return MessageFormat.format(localizedMessage, getArguments(locale));

    }

    @Nonnull
    protected abstract String getBaseMessage();

    protected abstract Object[] getArguments(Locale locale);

    /**
     * 주어진 로케일 정보에 맞는 메세지를 반환합니다.
     *
     * @param locale 로케일 정보
     * @param message 번역할 메세지
     * @return 영어 혹은 한국어로 번역된 메세지; 메세지를 찾지 못한 경우 영문 메세지를 반환합니다.
     */
    protected final String localizeBaseMessage(final Locale locale, final String message) {

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
