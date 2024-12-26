package com.yeohaeng_ttukttak.server.domain.travel.service;

import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel_name.TravelNameService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Locale;

@Service
@RequiredArgsConstructor
public class RenameTravelService {
    
    private final TravelNameService travelNameService;

    public Travel rename(Travel travel, Locale locale) {



    }
    
}
