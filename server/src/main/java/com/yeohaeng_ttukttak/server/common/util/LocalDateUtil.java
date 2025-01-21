package com.yeohaeng_ttukttak.server.common.util;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Objects;

public final class LocalDateUtil {

    private static final DateTimeFormatter ISO_FORMATTER =
            DateTimeFormatter.ofPattern("yyyy-MM-dd");

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

    /**
     * <pre>
     * 첫 날짜를 포함한 기간을 산출하고, 일 단위로 반환한다.
     *
     *   - 2024-12-29 ~ 2024-12-31 = 3
     *   - 2024-09-11 ~ 2024~09-17 = 7
     * </pre>
     * @param startDate 시작 날짜
     * @param endDate 종료 날짜
     * @return 일 단위로 산출된 두 날짜의 기간
     */
    public static long getBetweenDays(LocalDate startDate, LocalDate endDate) {
        return Duration.between(startDate.atStartOfDay(), endDate.atStartOfDay()).toDays() + 1;
    }

    public static String toISODateString(final LocalDate localDate) {
        return ISO_FORMATTER.format(localDate);
    }

}
