package com.yeohaeng_ttukttak.server.domain.travel.repository;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TravelParticipantRepository extends JpaRepository<TravelParticipant, Long> {

    List<TravelParticipant> findAllByTravelId(Long travelId);

}
