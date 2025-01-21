package com.yeohaeng_ttukttak.server.domain.member.service;

import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberService {

    private final MemberRepository memberRepository;

    /**
     * 지정된 식별자에 맞는 사용자를 찾아 반환한다.
     * @param memberId 찾을 사용자의 UUID
     * @return 조회된 사용자 엔티티
     * @throws AuthorizationFailException 사용자를 찾을 수 없는 경우 발생한다.
     */
    public Member find(String memberId) {
        return memberRepository
                .findByUuid(memberId)
                .orElseThrow(ExceptionCode.AUTHENTICATION_FAIL::wrap);
    }


}
