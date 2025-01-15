package com.yeohaeng_ttukttak.server.common.locale;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.interfaces.ArgumentException;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Locale;

@Service
@RequiredArgsConstructor
public class MessageSourceLocalizedMessageService implements LocalizedMessageService {

    private final MessageSource messageSource;

    @Override
    public <T extends BaseException> String fromException(final Locale locale, final T exception) {

        final Object[] arguments = resolveArguments(exception, locale);

        return messageSource.getMessage(exception.code(), arguments, locale);
    }

    private Object[] resolveArguments(BaseException exception, Locale locale) {
        if (exception instanceof ArgumentException argumentException) {
            return Arrays.stream(argumentException.args())
                    .map(arg -> resolveArgument(arg, locale))
                    .toArray();
        }
        return null;
    }

    private String resolveArgument(Object argument, Locale locale) {

        try {
            return messageSource.getMessage(argument.toString(), null, locale);

        } catch (NoSuchMessageException e) {

            return argument.toString();
        }
    }

}
