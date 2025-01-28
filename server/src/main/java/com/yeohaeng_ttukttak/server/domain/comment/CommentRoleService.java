package com.yeohaeng_ttukttak.server.domain.comment;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelPlanCommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CommentRoleService {

    private final TravelPlanCommentRepository commentRepository;

    public CommentWriterRole writer(final Long commentId) {
        final Comment comment = commentRepository.findById(commentId)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);

        return new CommentWriterRole(comment);
    }

}
