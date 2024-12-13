package com.yeohaeng_ttukttak.server.domain.comment;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.FailException;

public final class OnlyWriterCanAccessCommentFailException extends FailException {

    public OnlyWriterCanAccessCommentFailException() {
        super("ONLY_WRITER_CAN_DELETE_COMMENT_FAIL", null);
    }

}
