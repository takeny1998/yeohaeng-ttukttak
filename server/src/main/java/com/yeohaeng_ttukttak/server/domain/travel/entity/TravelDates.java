package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import com.yeohaeng_ttukttak.server.domain.travel.exception.InvalidTravelDateFormatFailException;
import com.yeohaeng_ttukttak.server.domain.travel.exception.TravelPeriodTooLongFailException;
import jakarta.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Embeddable
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelDates {

    private LocalDate startedOn;

    private LocalDate endedOn;

    /**
     * 지정한 기간에 맞춰 여행 기간 엔티티를 생성합니다.
     * @param startedOn 여행의 시작 날짜
     * @param endedOn 여행의 종료 날짜
     * @throws InvalidTravelDateFormatFailException 종료 날짜가 시작 날짜보다 빠른 경우 발생합니다.
     * @throws TravelPeriodTooLongFailException 두 날짜의 기간이 60일을 초과하는 경우 발생합니다.
     */
    public TravelDates(LocalDate startedOn, LocalDate endedOn) {
        if (startedOn.isAfter(endedOn)) {
            throw new InvalidTravelDateFormatFailException();
        }

        long days = LocalDateUtil.getBetweenDays(startedOn, endedOn);

        if (days > 60) {
            throw new TravelPeriodTooLongFailException();
        }

        this.startedOn = startedOn;
        this.endedOn = endedOn;
    }

    public LocalDate startedOn() {
        return startedOn;
    }

    public LocalDate endedOn() {
        return endedOn;
    }
}
