package com.yeohaeng_ttukttak.server.application.member.service;

import com.yeohaeng_ttukttak.server.domain.member.dto.MemberDto;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FindMemberService {

    private final MemberService memberService;
    private final Environment environment;

    public MemberDto findOne(String memberId) {
        final Member member = memberService.find(memberId);
        return MemberDto.of(environment.getProperty("AVATAR_HOST"), member);
    }

}
