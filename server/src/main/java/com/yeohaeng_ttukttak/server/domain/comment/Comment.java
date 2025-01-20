package com.yeohaeng_ttukttak.server.domain.comment;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Comment extends BaseTimeMemberEntity {

    @Id @GeneratedValue
    private Long id;

    private String content;

    public Comment(String content) {
        validateContent(content);
        this.content = content;
    }

    Long id() {
        return id;
    }

    String content() {
        return content;
    }

    /**
     * 댓글의 내용을 수정한다.
     * @param editorId 수정자의 식별자
     * @param newContent 수정할 댓글 내용
     * @throws PermissionRequiredFailException 댓글 작성자가 아닌 사용자가 수정을 시도한 경우 발생한다.
     */
    public void editContent(String editorId, String newContent) {
        verifyWriter(editorId);
        validateContent(newContent);

        this.content = newContent;
    }

    /**
     * 댓글 내용의 길이를 검사한다.
     * @param content 검사할 내용 문자열
     * @throws CommentContentLengthTooLongFailException 내용이 100 Byte가 넘어가는 경우 발생한다.
     */
    private void validateContent(String content) {
        final int byteLength = StringUtil.getByteLengthInEucKr(content);

        if (byteLength > 100) {
            throw ExceptionCode.COMMENT_CONTENT_LENGTH_TOO_LONG_FAIL.getInstance();
        }
    }

    /**
     * 댓글을 쓴 사용자가 맞는지 접근 권한을 검사한다.
     * @param memberId 검사할 사용자의 식별자
     * @throws PermissionRequiredFailException 댓글을 쓴 사용자가 이닌 경우 발생한다.
     */
    public void verifyWriter(String memberId) {

        final String writerId = createdBy().uuid();

        if (!Objects.equals(memberId, writerId)) {
            throw ExceptionCode.AUTHORIZATION_FAIL.getInstance();
        }

    }
}
