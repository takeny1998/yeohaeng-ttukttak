package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.*;
import lombok.Getter;

@Getter
public enum DomainException {

    CANNOT_INVITE_YOURSELF_FAIL(new FailException() {
        @Override
        protected String getBaseMessage() {
            return "You cannot invite yourself to the travel. Please invite another user.";
        }
    }),

    DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL(new ArgumentOutOfRangeFailException("dayOfTravel", 0, "endedOn") {}),

    INVALID_TRAVEL_NAME_CHARACTER_FAIL(new ArgumentFailException("name") {
        @Override
        protected String getBaseMessage() {
            return "The name of travel must consist of alphanumeric, and commas.";
        }
    }),

    INVALID_NICKNAME_CHARACTER_FAIL(new ArgumentFailException("nickname") {
        @Override
        protected String getBaseMessage() {
            return super.getBaseMessage();
        }
    }),

    NICKNAME_HAS_BAD_WORD_FAIL(new ArgumentFailException("nickname") {
        @Override
        protected String getBaseMessage() {
            return "The nickname contains inappropriate language. Please choose a different word.";
        }
    }),

    NICKNAME_LENGTH_OUT_OF_RANGE_FAIL(new ArgumentByteOutOfRangeFailException("nickname", 4, 20) {}),

    STARTED_ON_AFTER_ENDED_ON_FAIL(new ArgumentFailException("startedOn") {
        @Override
        protected String getBaseMessage() {
            return "The start date must be the same as or earlier than the end date.";
        }
    }),

    TRAVEL_ALREADY_JOINED_FAIL(new FailException(null) {
        @Override
        protected String getBaseMessage() {
            return "You've already joined the travel.";
        }
    }),

    TRAVEL_CITY_COUNT_EXCEEDED_FAIL(new ArgumentCountExceededException("cityIds", 10) {}),

    TRAVEL_COMPANION_TYPE_COUNT_OUT_OF_RANGE_FAIL(new ArgumentOutOfRangeFailException("companionTypes", 1, 10) {}),

    TRAVEL_MOTIVATION_TYPE_COUNT_OUT_OF_RANGE_FAIL(new ArgumentOutOfRangeFailException("motivationTypes", 1, 10) {}),

    TRAVEL_NAME_TOO_LONG_FAIL(new ArgumentByteLimitExceededFailException("name", 100) {}),

    TRAVEL_PERIOD_TOO_LONG_FAIL(new ArgumentFailException("endedOn") {
        @Override
        protected String getBaseMessage() {
            return "The travel period must not exceed 60 days.";
        }
    }),

    WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL(new ArgumentFailException("startedOn") {
        @Override
        protected String getBaseMessage() {
            return "willVisitOn must be within the travel period.";
        }
    });

    private final BaseException instance;

    DomainException(BaseException instance) {
        this.instance = instance;
    }

}
