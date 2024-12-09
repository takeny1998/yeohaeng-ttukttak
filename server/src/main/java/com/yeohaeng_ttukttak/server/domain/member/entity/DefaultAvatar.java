package com.yeohaeng_ttukttak.server.domain.member.entity;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Objects;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DiscriminatorValue("D")
public class DefaultAvatar extends Avatar {

    private static final List<String> ageGroupKeyword = List.of("kid", "young", "middle", "old");
    private static final List<String> genderKeyword = List.of("male", "female");

    private static final int imagesPerType = 24;


    @Override
    public String path() {
        int avatarIndex = (int) (member().id() % imagesPerType) + 1;

        return "avatars/%s/%s/%d".formatted(
                parseGender(member()), parseAgeGroup(member()), avatarIndex);
    }

    @Override
    public String ext() {
        return "png";
    }

    private String parseAgeGroup(Member member) {

        if (Objects.isNull(member.ageGroup())) {
            int index = (int)(member.id() % ageGroupKeyword.size());
            return ageGroupKeyword.get(index);
        }

        return switch (member.ageGroup()) {
            case underNine, teens -> ageGroupKeyword.get(0);
            case twenties, thirties -> ageGroupKeyword.get(1);
            case forties, fifties -> ageGroupKeyword.get(2);
            case sixties, seventiesPlus -> ageGroupKeyword.get(3);
        };

    }

    private String parseGender(Member member) {

        if (Objects.isNull(member.gender())) {
            int index = (int)(member.id() % genderKeyword.size());
            return genderKeyword.get(index);
        }

        return member.gender().name();

    }

}
