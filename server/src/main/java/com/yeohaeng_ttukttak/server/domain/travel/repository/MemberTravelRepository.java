package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface MemberTravelRepository extends JpaRepository<MemberTravel, Long> {

    @Query("SELECT t FROM MemberTravel t WHERE t.member.id = :memberId")
    List<Travel> findAllByMemberId(UUID memberId);

}
