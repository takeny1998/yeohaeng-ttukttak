package com.yeohaeng_ttukttak.server.common.exception;

import com.yeohaeng_ttukttak.server.common.exception.dto.ErrorExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.exception.dto.ExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.exception.dto.FailExceptionWrapper;
import com.yeohaeng_ttukttak.server.common.exception.exception.BaseException;
import com.yeohaeng_ttukttak.server.common.exception.exception.ErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.*;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument.ArgumentByteLimitExceededFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument.ArgumentByteOutOfRangeFailException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument.ArgumentCountExceededException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.argument.ArgumentOutOfRangeFailException;
import jakarta.annotation.Nonnull;

public enum ExceptionCode {

    AUTHENTICATION_FAIL(new FailException() {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "Authentication failed. Please check your credentials and try again.";
        }
    }),

    AUTHORIZATION_FAIL(new FailException() {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "Authorization failed. You do not have the permissions to access this resource.";
        }
    }),

    CANNOT_INVITE_YOURSELF_FAIL(new FailException() {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "You cannot invite yourself to the travel. Please invite another user.";
        }
    }),

    COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL(new ArgumentByteLimitExceededFailException("nickname", 100)),

    ENTITY_NOT_FOUND_FAIL(new FailException() {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "The requested entity could not be found. Please verify the identifier and try again.";
        }
    }),

    DAY_OF_TRAVEL_OUT_OF_RANGE_FAIL(new ArgumentOutOfRangeFailException("dayOfTravel", 0, "endedOn")),

    INVALID_TRAVEL_NAME_CHARACTER_FAIL(new ArgumentFailException("name") {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "The name of travel must consist of alphanumeric, and commas.";
        }
    }),

    INVALID_NICKNAME_CHARACTER_FAIL(new ArgumentFailException("nickname") {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "The nickname must consist of alphanumeric.";
        }
    }),

    NICKNAME_HAS_BAD_WORD_FAIL(new ArgumentFailException("nickname") {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "The nickname contains inappropriate language. Please choose a different word.";
        }
    }),

    NICKNAME_LENGTH_OUT_OF_RANGE_FAIL(new ArgumentByteOutOfRangeFailException("nickname", 4, 20)),

    STARTED_ON_AFTER_ENDED_ON_FAIL(new ArgumentFailException("startedOn") {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "The start date must be the same as or earlier than the end date.";
        }
    }),

    TRAVEL_ALREADY_JOINED_FAIL(new FailException() {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "You've already joined the travel.";
        }
    }),

    TRAVEL_CITY_COUNT_EXCEEDED_FAIL(new ArgumentCountExceededException("cityIds", 10)),

    TRAVEL_COMPANION_TYPE_COUNT_OUT_OF_RANGE_FAIL(new ArgumentOutOfRangeFailException("companionTypes", 1, 10)),

    TRAVEL_MOTIVATION_TYPE_COUNT_OUT_OF_RANGE_FAIL(new ArgumentOutOfRangeFailException("motivationTypes", 1, 10)),

    TRAVEL_NAME_TOO_LONG_FAIL(new ArgumentByteLimitExceededFailException("name", 100)),

    TRAVEL_PERIOD_TOO_LONG_FAIL(new ArgumentFailException("endedOn") {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "The travel period must not exceed 60 days.";
        }
    }),

    WILL_VISIT_ON_OUT_OF_TRAVEL_PERIOD_FAIL(new ArgumentFailException("startedOn") {
        @Nonnull
        @Override
        protected String getBaseMessage() {
            return "willVisitOn must be within the travel period.";
        }
    });

    private final BaseException instance;

    ExceptionCode(BaseException instance) {
        this.instance = instance;
    }

    public ExceptionWrapper wrap() {

        if (instance instanceof FailException failException) {
            return new FailExceptionWrapper(this.name(), failException);
        }

        if (instance instanceof ErrorException errorException) {
            return new ErrorExceptionWrapper(this.name(), errorException);
        }

        throw new IllegalStateException(this.name() + "의 예외 인스턴스가 연결되지 않았습니다.");

    }

}
