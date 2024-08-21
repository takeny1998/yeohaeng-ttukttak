package com.yeohaeng_ttukttak.server.common.util;

import java.util.Base64;

import static java.util.UUID.randomUUID;

public class MyStringUtil {

    public static String generateShortUUID() {

        return randomUUID().toString()
                .replace("-", "")
                .substring(0, 8);

    }

    public static String toBase64Url(byte[] bytes) {
        return Base64.getUrlEncoder()
                .withoutPadding()
                .encodeToString(bytes);
    }

    public static String fromBase64Url(String string) {

        return new String(Base64.getUrlDecoder().decode(string));

    }


}
