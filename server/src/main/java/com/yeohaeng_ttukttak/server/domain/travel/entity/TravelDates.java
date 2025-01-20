package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.LocalDateUtil;
import jakarta.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Objects;

@Embeddable
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelDates {

    private LocalDate startedOn;

    private LocalDate endedOn;

    /**
     * 지정한 기간에 맞춰 여행 기간 엔티티를 생성합니다.
     *
     * @param startedOn 여행의 시작 날짜
     * @param endedOn 여행의 종료 날짜
     */
    public TravelDates(LocalDate startedOn, LocalDate endedOn) {
        updateDates(startedOn, endedOn);
    }

    /**
     * startedOn, endedOn을 받아 여행 기반을 설정합니다.
     *
     * @param startedOn 여행의 시작 날짜
     * @param endedOn 여행의 종료 날짜
     * @throws FailException 종료 날짜가 시작 날짜보다 빠른 경우 발생합니다.
     * @throws FailException 두 날짜의 기간이 60일을 초과하는 경우 발생합니다.
     */
    void updateDates(final LocalDate startedOn, final LocalDate endedOn) {

        if (Objects.nonNull(startedOn)) {
            this.startedOn = startedOn;
        }

        if (Objects.nonNull(endedOn)) {
            this.endedOn = endedOn;
        }

        final boolean isAnyNull = Objects.isNull(startedOn) || Objects.isNull(endedOn);

        if (isAnyNull || this.startedOn.isAfter(this.endedOn)) {
            throw ExceptionCode.STARTED_ON_AFTER_ENDED_ON_FAIL.getInstance();
        }

        long days = LocalDateUtil.getBetweenDays(this.startedOn, this.endedOn);

        if (days > 60) {
            throw ExceptionCode.TRAVEL_PERIOD_TOO_LONG_FAIL.getInstance();
        }

    }

    public LocalDate startedOn() {
        return startedOn;
    }

    public LocalDate endedOn() {
        return endedOn;
    }


}
