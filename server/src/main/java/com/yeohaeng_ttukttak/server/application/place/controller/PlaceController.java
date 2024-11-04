package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.PlaceCategoryType;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Transactional(readOnly = true)
@RestController
@RequestMapping("/api/v2/places")
@RequiredArgsConstructor
public class PlaceController {

    private final PlaceRepository placeRepository;

    @GetMapping
    public List<PlaceDto> findByCategory(@RequestParam PlaceCategoryType category) {

        return placeRepository.findByCategory(category).stream()
                .map(PlaceDto::of)
                .toList();
    }

}
