package com.yeohaeng_ttukttak.server.domain.comment;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@MappedSuperclass
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public abstract class Comment extends BaseTimeMemberEntity {

    @Id @GeneratedValue
    private Long id;

    private String content;

    public Comment(final String content) {
        editContent(content);
    }

    /**
     * 댓글의 내용을 수정한다.
     * @param newContent 수정할 댓글 내용
     */
    public void editContent(String newContent) {
        final int byteLength = StringUtil.getByteLengthInEucKr(newContent);

        if (byteLength > getContentByteLimit()) {
            throw ExceptionCode.COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL.wrap();
        }

        this.content = newContent;
    }

    @Transient
    protected abstract int getContentByteLimit();

}
