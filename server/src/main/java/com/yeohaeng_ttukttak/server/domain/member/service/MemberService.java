package com.yeohaeng_ttukttak.server.domain.member.service;

import com.yeohaeng_ttukttak.server.common.exception.exception.error.AuthorizationErrorException;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository repository;

    public Member find(String memberId) {
        return repository
                .findById(UUID.fromString(memberId))
                .orElseThrow(AuthorizationErrorException::new);
    }


}
