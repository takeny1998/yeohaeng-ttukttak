package com.yeohaeng_ttukttak.server.common.serializer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SerializationConfig {

    @Autowired
    public void doublePrecisionSerializer(ObjectMapper objectMapper) {
        final SimpleModule module = new SimpleModule();
        module.addSerializer(Double.class, new DoublePrecisionSerializer());

        objectMapper.registerModule(module);
    }

}
