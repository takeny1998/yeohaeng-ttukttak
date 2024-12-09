package com.yeohaeng_ttukttak.server.application.member.service;

import com.yeohaeng_ttukttak.server.domain.member.entity.AgeGroup;
import com.yeohaeng_ttukttak.server.domain.member.entity.Gender;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.service.MemberService;
import com.yeohaeng_ttukttak.server.domain.nickname.Nickname;
import com.yeohaeng_ttukttak.server.domain.nickname.NicknameService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class UpdateMemberService {

    private final MemberService memberService;
    private final NicknameService nicknameService;

    @Transactional
    public void updateProfile(String memberId, String nickname, AgeGroup ageGroup, Gender gender) {

        final Member member = memberService.find(memberId);
        Nickname updateNickname = null;

        if (Objects.nonNull(nickname)) {
            updateNickname = nicknameService.create(nickname);
        }

        member.updateProfile(updateNickname, gender, ageGroup);

    }

}
