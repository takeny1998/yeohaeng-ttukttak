package com.yeohaeng_ttukttak.server.application.travel_plan_comment.dto;

import jakarta.validation.constraints.NotEmpty;

/**
 * 댓글 본문을 나타내는 요청 객체입니다.
 *
 * @param content 본문으로 사용할 문자열
 *                <ul>
 *                  <li>본문의 크기는 50Byte(Euc-kr 기준)를 넘을 수 없습니다.</li>
 *                </ul>
 */
public record CommentContentRequest(
        @NotEmpty String content
) { }
