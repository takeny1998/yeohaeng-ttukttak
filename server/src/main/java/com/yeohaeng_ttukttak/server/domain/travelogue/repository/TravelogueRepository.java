package com.yeohaeng_ttukttak.server.domain.travelogue.repository;

import com.yeohaeng_ttukttak.server.domain.travelogue.entity.Travelogue;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TravelogueRepository extends JpaRepository<Travelogue, Long> { }
