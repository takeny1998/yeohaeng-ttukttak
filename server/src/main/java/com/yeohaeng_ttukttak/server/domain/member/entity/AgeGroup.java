package com.yeohaeng_ttukttak.server.domain.member.entity;

import java.time.LocalDate;
import java.time.Period;
import java.util.Objects;

public enum AgeGroup {
    underNine,
    teens,
    twenties,
    thirties,
    forties,
    fifties,
    sixties,
    seventiesPlus;

    /**
     * 생년월일 기반으로 알맞은 연령대 그룹을 반환한다. 올바른 형식이 아닌 경우 null을 반환한다.
     * @param birthDate 생년월일
     * @return 연령대 그룹 혹은 null
     */
    static AgeGroup fromBrithDate(LocalDate birthDate) {
        final LocalDate currentDate = LocalDate.now();

        if (Objects.isNull(birthDate)) {
            return null;
        }

        final int age = Period
                .between(birthDate, currentDate)
                .getYears();

        if (age <= 0) return null;

        if (age < 10) return underNine;
        if (age < 20) return teens;
        if (age < 30) return twenties;
        if (age < 40) return thirties;
        if (age < 50) return forties;
        if (age < 60) return fifties;
        if (age < 70) return sixties;

        return seventiesPlus;
    }

}
