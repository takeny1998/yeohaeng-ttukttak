package com.yeohaeng_ttukttak.server.common.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.Serializable;
import java.util.Base64;
import java.util.Map;
import java.util.Objects;

import static java.util.UUID.randomUUID;

public class StringUtil {

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    public static String generateShortUUID() {

        return randomUUID().toString()
                .replace("-", "")
                .substring(0, 8);

    }

    public static String toJsonString(Object object) throws JsonProcessingException {
         return OBJECT_MAPPER.writeValueAsString(object);
    }

}
