package com.yeohaeng_ttukttak.server.common.util;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class LocalDateUtil {

    private LocalDateUtil() {}

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
