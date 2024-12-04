package com.yeohaeng_ttukttak.server.domain.member.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.AuthorizationErrorException;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundFailException;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository repository;

    /**
     * 지정된 식별자에 맞는 사용자를 찾아 반환한다.
     * @param memberId 찾을 사용자의 식별자
     * @return 사용자 엔티티
     * @throws AuthorizationErrorException 사용자를 찾을 수 없는 경우 발생한다.
     */
    public Member find(String memberId) {
        return repository
                .findById(UUID.fromString(memberId))
                .orElseThrow(AuthorizationErrorException::new);
    }


}
