package com.yeohaeng_ttukttak.server.common.util;

public class EnumUtil {

    private EnumUtil() {}

    /**
     * 문자열으로 Enum 값을 찾아 반환한다. 문자열이 값이 없거나 null인 경우, null을 반환한다.
     * @param clazz 값을 찾을 Enum 클래스
     * @param value 문자열 값
     * @return 찾은 Enum 값 혹은 null
     */
    public static <T extends Enum<T>> T fromStringOrNull(Class<T> clazz, String value) {
        try {
            return Enum.valueOf(clazz, value);
        } catch (IllegalArgumentException | NullPointerException ex) {
            return null;
        }
    }

}
