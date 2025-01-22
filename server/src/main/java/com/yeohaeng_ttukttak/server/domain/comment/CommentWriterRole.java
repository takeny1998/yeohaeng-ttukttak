package com.yeohaeng_ttukttak.server.domain.comment;

import com.yeohaeng_ttukttak.server.common.authorization.interfaces.Role;

public class CommentWriterRole implements Role {

    private final String writerId;

    public CommentWriterRole(final Comment comment) {
        this.writerId = comment.createdBy().uuid();
    }

    @Override
    public boolean checkGrantable(final String memberId) {
        return writerId.equals(memberId);
    }

}
