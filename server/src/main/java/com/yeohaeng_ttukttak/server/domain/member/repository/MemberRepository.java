package com.yeohaeng_ttukttak.server.domain.member.repository;

import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    @Query("SELECT m FROM Member m WHERE m.auth.openId = :openId")
    Optional<Member> findByOpenId(String openId);

    @Query("SELECT m FROM Member m WHERE m.uuid = :uuid")
    Optional<Member> findByUuid(String uuid);

}
