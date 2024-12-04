package com.yeohaeng_ttukttak.server.common.util;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.Objects;

public class LocalDateUtil {

    private LocalDateUtil() {}

    /**
     * 문자열 값을 LocalDate로 변환한다. 예외 발생 시 null을 반환한다.
     * @param value 변환할 값
     * @return 변환된 LocalDate 혹은 null
     */
    public static LocalDate fromStringOrNull(String value) {
        if (Objects.isNull(value)) {
            return null;
        }

        try {
            return LocalDate.parse(value);
        } catch (DateTimeParseException ex) {
            return null;
        }
    }

    public static boolean isInRange(LocalDate targetDate, LocalDate startDate, LocalDate endDate) {

        final LocalDateTime startDateTime = startDate.atStartOfDay();
        final LocalDateTime endDateTime = endDate.atStartOfDay();
        final LocalDateTime targetDateTime = targetDate.atStartOfDay();

        return (targetDateTime.isEqual(startDateTime) || targetDateTime.isAfter(startDateTime))
                && (targetDateTime.isEqual(endDateTime) || targetDateTime.isBefore(endDateTime));
    }

    public static long getBetweenDays(LocalDate startDate, LocalDate endDate) {
        return Duration.between(startDate.atStartOfDay(), endDate.atStartOfDay()).toDays();
    }

}
