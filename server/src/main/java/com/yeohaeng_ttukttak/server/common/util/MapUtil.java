package com.yeohaeng_ttukttak.server.common.util;

import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

public class MapUtil {

    public static <T> Map<String, String> parse(String string) {

        return Arrays.stream(string.split(","))
                .map(s -> s.trim().split("="))
                .collect(Collectors.toMap(tokens -> tokens[0], tokens -> tokens[1]));

    }
}
