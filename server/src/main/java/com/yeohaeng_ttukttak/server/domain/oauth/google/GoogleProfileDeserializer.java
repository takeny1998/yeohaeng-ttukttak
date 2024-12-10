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

        final String genderString = Optional
                .ofNullable(rootNode.findValue("genders"))
                .map(node -> node.findValue("value"))
                .map(node -> node.asText().toLowerCase())
                .orElse("");

        Gender gender;

        try {
            gender = Gender.valueOf(genderString);
        } catch (IllegalArgumentException ex) {
            gender = null;
        }

        String nickname = Optional.ofNullable(rootNode.findValue("nicknames"))
                .map(node -> node.findValue("value"))
                .map(JsonNode::asText)
                .orElse(null);

        return new GoogleProfileResponse(birthDate, gender, nickname);
    }

    private LocalDate parseDateNode(JsonNode dateNode) {

        if (dateNode == null) return null;

        final Integer year = getIntOrNull(dateNode, "year");
        final Integer month = getIntOrNull(dateNode, "month");
        final Integer day = getIntOrNull(dateNode, "day");

        if (year == null || month == null || day == null) {
            return null;
        }

        try {
            return LocalDate.of(year, month, day);
        } catch (DateTimeException ex) {
            return null;
        }

    }

    private Integer getIntOrNull(JsonNode node, String key) {
        if (node == null || node.isNull()) return null;
        final JsonNode foundNode = node.get(key);

        if (foundNode == null || foundNode.isNull()) return null;
        return foundNode.asInt();
    }

}
