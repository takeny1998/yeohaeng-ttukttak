package com.yeohaeng_ttukttak.server.common.exception.exception;

import com.yeohaeng_ttukttak.server.common.locale.RequestLocaleService;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.MessageSource;

import java.text.MessageFormat;
import java.util.Locale;

@Configurable(autowire = Autowire.BY_TYPE)
public abstract class BaseException extends RuntimeException {

    @Autowired
    protected RequestLocaleService requestLocaleService;

    @Autowired
    protected MessageSource messageSource;

    protected BaseException(Throwable cause) {
        super(cause);
    }

    public String getMessage() {
        return getMessage(requestLocaleService.getCurrentLocale());
    }

    public String getMessage(final Locale locale) {

        final boolean isEnglish = locale.getLanguage().equalsIgnoreCase("en");

        final String localizedMessage = isEnglish
                ? getBaseMessage()
                : messageSource.getMessage(getBaseMessage(), null, locale);

        return MessageFormat.format(localizedMessage, getArguments());
    }

    protected abstract String getBaseMessage();

    protected abstract Object[] getArguments();

}
