package com.yeohaeng_ttukttak.server.common.util;

import org.springframework.util.StringUtils;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Base64;
import java.util.UUID;

public class StringUtil {

    private StringUtil() {}

    /**
     * 22자 길이의 URL-Safe UUIDv4를 생성한다.
     * @return 생성된 UUID 문자열
     */
    public static String createShortUUID() {
        final UUID uuid = UUID.randomUUID();

        final ByteBuffer buffer = ByteBuffer.wrap(new byte[16]);

        buffer.putLong(uuid.getMostSignificantBits());
        buffer.putLong(uuid.getLeastSignificantBits());

        final String encodedUUID = Base64
                .getUrlEncoder()
                .encodeToString(buffer.array());

        return StringUtils.trimTrailingCharacter(encodedUUID, '=');
    }

    public static int getByteLengthInEucKr(String string) {
        try {
            return string.getBytes("euc-kr").length;
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

}
