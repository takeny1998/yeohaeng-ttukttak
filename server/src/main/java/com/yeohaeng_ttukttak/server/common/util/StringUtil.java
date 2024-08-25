package com.yeohaeng_ttukttak.server.common.util;

import java.util.Base64;
import java.util.Map;

import static java.util.UUID.randomUUID;

public class StringUtil {

    public static String generateShortUUID() {

        return randomUUID().toString()
                .replace("-", "")
                .substring(0, 8);

    }

}
