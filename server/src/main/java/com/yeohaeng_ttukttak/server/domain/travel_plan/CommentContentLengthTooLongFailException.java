package com.yeohaeng_ttukttak.server.domain.travel_plan;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;


public final class CommentContentLengthTooLongFailException extends FailException {

    public CommentContentLengthTooLongFailException() {
        super("COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL", "content");
    }
}
