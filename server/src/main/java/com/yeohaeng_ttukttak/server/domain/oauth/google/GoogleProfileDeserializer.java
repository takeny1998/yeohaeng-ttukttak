package com.yeohaeng_ttukttak.server.domain.oauth.google;

import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.oauth.dto.ProfileDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.util.Optional;

@Slf4j
@Component
public class GoogleProfileDeserializer extends JsonDeserializer<GoogleProfileResponse> {

    @Override
    public GoogleProfileResponse deserialize(
            JsonParser parser, DeserializationContext ctxt) throws IOException, JacksonException {

        final JsonNode rootNode = parser.getCodec().readTree(parser);

        log.debug("rootNode={}", rootNode.toPrettyString());

        final LocalDate birthDate = Optional
                .ofNullable(rootNode.findValue("birthdays"))
                .map(node -> node.findValue("date"))
                .map(this::parseDateNode)
                .orElse(null);

        final String value = Optional
                .ofNullable(rootNode.findValue("genders"))
                .map(node -> node.findValue("value"))
                .map(node -> node.asText().toLowerCase())
                .orElse("");

        Gender gender;

        try {
            gender = Gender.valueOf(value);
        } catch (IllegalArgumentException ex) {
            gender = null;
        }

        return new GoogleProfileResponse(birthDate, gender);
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
