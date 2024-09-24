package com.yeohaeng_ttukttak.server.common.validation;

import com.yeohaeng_ttukttak.server.common.dto.DateRange;
import com.yeohaeng_ttukttak.server.common.validation.annotation.ValidateFutureDateRange;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.time.LocalDate;

public final class FutureDateRangeValidator implements ConstraintValidator<ValidateFutureDateRange, DateRange> {

    @Override
    public boolean isValid(DateRange value, ConstraintValidatorContext context) {
        final LocalDate now = LocalDate.now();

        final LocalDate startedOn = value.startedOn();
        final LocalDate endedOn = value.endedOn();

        if (startedOn.isBefore(now) || endedOn.isBefore(now)) return false;
        return endedOn.isAfter(startedOn);
    }

}
