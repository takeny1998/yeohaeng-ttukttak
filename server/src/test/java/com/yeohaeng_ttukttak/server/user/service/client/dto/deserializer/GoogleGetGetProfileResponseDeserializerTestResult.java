package com.yeohaeng_ttukttak.server.user.service.client.dto.deserializer;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeohaeng_ttukttak.server.oauth2.service.provider.google.client.dto.get_profile.GetProfileResponse;
import com.yeohaeng_ttukttak.server.user.domain.Gender;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;


class GoogleGetGetProfileResponseDeserializerTestResult {

    @Test
    void deserialize_test() throws JsonProcessingException {

        // GIVEN
        String jsonString = """
        {
            "resourceName": "people/7483916205841930264712",
            "etag": "A7dK9tL1mQ4pW8rZ3vX2bC0sF6nYj5oHkU7",
            "genders": [
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "PROFILE",
                            "id": "7483916205841930264712"
                        }
                    },
                    "value": "male",
                    "formattedValue": "Male"
                }
            ],
            "birthdays": [
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "ACCOUNT",
                            "id": "7483916205841930264712"
                        }
                    },
                    "date": {
                        "year": 1998,
                        "month": 11,
                        "day": 17
                    }
                }
            ]
        }
        """;

        // WHEN
        GetProfileResponse profileResponse = new ObjectMapper()
                .readValue(jsonString, GetProfileResponse.class);

        // THEN
        assertThat(profileResponse.birthday())
                .isEqualTo(LocalDate.of(1998, 11, 17));

        assertThat(profileResponse.gender()).isEqualTo(Gender.MALE);

    }

    @Test
    void deserialize_null_test() throws JsonProcessingException {

        // GIVEN
        String jsonString = """
        {
            "resourceName": "people/7483916205841930264712",
            "etag": "A7dK9tL1mQ4pW8rZ3vX2bC0sF6nYj5oHkU7",
            "genders": [],
            "birthdays": []
        }
        """;

        // WHEN
        GetProfileResponse profileResponse = new ObjectMapper()
                .readValue(jsonString, GetProfileResponse.class);

        // THEN
        assertThat(profileResponse.birthday()).isNull();
        assertThat(profileResponse.gender()).isEqualTo(Gender.NONE);

    }

    @Test
    void deserialize_other_value_test() throws JsonProcessingException {

        // GIVEN
        String jsonString = """
        {
            "resourceName": "people/7483916205841930264712",
            "etag": "A7dK9tL1mQ4pW8rZ3vX2bC0sF6nYj5oHkU7",
            "genders": [
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "PROFILE",
                            "id": "7483916205841930264712"
                        }
                    },
                    "value": "unspecified",
                    "formattedValue": "Unspecified"
                }
            ],
            "birthdays": []
        }
        """;

        // WHEN
        GetProfileResponse profileResponse = new ObjectMapper()
                .readValue(jsonString, GetProfileResponse.class);

        // THEN
        assertThat(profileResponse.birthday()).isNull();
        assertThat(profileResponse.gender()).isEqualTo(Gender.NONE);

    }

    @Test
    void deserialize_multiple_value_test() throws JsonProcessingException {
        String jsonString = """
        {
            "resourceName": "people/7483916205841930264712",
            "etag": "A7dK9tL1mQ4pW8rZ3vX2bC0sF6nYj5oHkU7",
            "genders": [
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "PROFILE",
                            "id": "7483916205841930264712"
                        }
                    },
                    "value": "male",
                    "formattedValue": "Male"
                },
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "PROFILE",
                            "id": "7483916205841930264712"
                        }
                    },
                    "value": "female",
                    "formattedValue": "Female"
                }
            ],
            "birthdays": [
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "ACCOUNT",
                            "id": "7483916205841930264712"
                        }
                    },
                    "date": {
                        "year": 1998,
                        "month": 11,
                        "day": 17
                    }
                },
                {
                    "metadata": {
                        "primary": true,
                        "source": {
                            "type": "ACCOUNT",
                            "id": "7483916205841930264712"
                        }
                    },
                    "date": {
                        "year": 1998,
                        "month": 11,
                        "day": 18
                    }
                }
            ]
        }
        """;

        // WHEN
        GetProfileResponse profileResponse = new ObjectMapper()
                .readValue(jsonString, GetProfileResponse.class);

        // THEN
        assertThat(profileResponse.birthday())
                .isEqualTo(LocalDate.of(1998, 11, 17));

        assertThat(profileResponse.gender()).isEqualTo(Gender.MALE);
    }

    @Test
    void deserialize_no_key_test() throws JsonProcessingException {

        String jsonString = """
        {
            "resourceName": "people/7483916205841930264712",
            "etag": "A7dK9tL1mQ4pW8rZ3vX2bC0sF6nYj5oHkU7"
        }
        """;

        // WHEN
        GetProfileResponse profileResponse = new ObjectMapper()
                .readValue(jsonString, GetProfileResponse.class);

        // THEN
        assertThat(profileResponse.birthday()).isNull();
        assertThat(profileResponse.gender()).isEqualTo(Gender.NONE);

    }


}