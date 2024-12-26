package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TravelRepository extends JpaRepository<Travel, Long> {

    @Query("SELECT t FROM Travel t " +
            "LEFT JOIN t.participants tp " +
            "LEFT JOIN tp.invitee tpm " +
            "WHERE t.createdBy.uuid = :memberId " +
            "      OR tpm.uuid = :memberId " +
            "ORDER BY t.dates.startedOn ASC, t.dates.endedOn ASC, t.id ASC")
    List<Travel> findAllMemberParticipated(String memberId);

}
