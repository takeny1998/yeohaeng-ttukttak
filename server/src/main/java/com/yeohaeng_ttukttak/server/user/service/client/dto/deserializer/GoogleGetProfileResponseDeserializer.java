package com.yeohaeng_ttukttak.server.user.service.client.dto.deserializer;

import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.yeohaeng_ttukttak.server.user.service.client.dto.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.domain.Gender;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.util.Optional;

@Slf4j
public class GoogleGetProfileResponseDeserializer extends JsonDeserializer<GetProfileResponse> {

    @Override
    public GetProfileResponse deserialize(
            JsonParser parser, DeserializationContext ctxt) throws IOException, JacksonException {

        final JsonNode rootNode = parser.getCodec().readTree(parser);

        LocalDate birthday = Optional
                .ofNullable(rootNode.findValue("birthdays"))
                .map(node -> node.findValue("date"))
                .map(this::parseDateNode)
                .orElse(null);

        String value = Optional
                .ofNullable(rootNode.findValue("genders"))
                .map(node -> node.findValue("value"))
                .map(node -> node.asText().toUpperCase())
                .orElse("NONE");

        Gender gender;

        try {
            gender = Gender.valueOf(value);
        } catch (IllegalArgumentException ex) {
            gender = Gender.NONE;
        }

        return new GetProfileResponse(birthday, gender);
    }


    private LocalDate parseDateNode(JsonNode dateNode) {

        if (dateNode == null) return null;

        int year = dateNode.get("year").asInt(0);
        int month = dateNode.get("month").asInt(0);
        int day = dateNode.get("day").asInt(0);

        try {
            return LocalDate.of(year, month, day);
        } catch (DateTimeException ex) {
            return null;
        }

    }

}
