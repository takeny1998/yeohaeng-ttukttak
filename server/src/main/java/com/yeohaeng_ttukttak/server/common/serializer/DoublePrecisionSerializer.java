package com.yeohaeng_ttukttak.server.common.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public final class DoublePrecisionSerializer extends JsonSerializer<Double>  {

    @Override
    public void serialize(Double value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeNumber(String.format("%.2f", value));
    }

}
