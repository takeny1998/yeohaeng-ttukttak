package com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.comment.CommentDto;

import java.util.List;

/**
 * 댓글 목록을 나타내는 응답 객체입니다.
 */
public final class CommentListResponse extends ServerSuccessResponse<CommentListResponse.CommentListData> {

    /**
     * @param comments 댓글 목록
     *                 <ul>
     *                  <li>댓글 목록은 아래와 같은 기준으로 정렬됩니다:</li>
     *                  <ol>
     *                      <li>생성일시(createdAt)가 빠른 댓글이 우선 정렬됩니다.</li>
     *                      <li>마지막 수정일시(lastModifiedAt)이 빠른 순으로 정렬됩니다.</li>
     *                      <li>식별자가 작은 순으로 정렬됩니다.</li>
     *                  </ol>
     *                 </ul>
     */
    public CommentListResponse(List<CommentDto> comments) {
        super(new CommentListData(comments));
    }

    public record CommentListData(List<CommentDto> comments) { }
}
