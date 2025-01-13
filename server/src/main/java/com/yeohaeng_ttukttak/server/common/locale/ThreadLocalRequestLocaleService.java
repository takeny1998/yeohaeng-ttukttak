package com.yeohaeng_ttukttak.server.common.locale;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.Locale;

@Service
public class ThreadLocalRequestLocaleService implements RequestLocaleService {

    @Override
    public Locale getCurrentLocale() {
        return LocaleContextHolder.getLocale();
    }

}
