package com.yeohaeng_ttukttak.server.common.util;

import static java.util.UUID.randomUUID;

public class MyStringUtil {

    public static String generateShortUUID() {

        return randomUUID().toString()
                .replace("-", "")
                .substring(0, 8);

    }

}
