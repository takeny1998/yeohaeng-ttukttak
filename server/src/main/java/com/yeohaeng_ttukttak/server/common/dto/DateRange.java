package com.yeohaeng_ttukttak.server.common.dto;

import java.time.LocalDate;

public record DateRange(
        LocalDate startedOn,
        LocalDate endedOn
) {}