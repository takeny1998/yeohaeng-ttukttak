package com.yeohaeng_ttukttak.server.domain.member.repository;

import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface MemberRepository extends JpaRepository<Member, UUID> {

    @Query("SELECT u FROM Member u WHERE u.auth.openId = :openId")
    Optional<Member> findByOpenId(String openId);

}
