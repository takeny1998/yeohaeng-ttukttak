package com.yeohaeng_ttukttak.server.application.place.controller;

import com.yeohaeng_ttukttak.server.application.place.controller.dto.FindPlaceResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.http.JsonRequestMapping;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.place.repository.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@JsonRequestMapping("/api/v2/places")
@RequiredArgsConstructor
public class PlaceController {

    private final PlaceRepository placeRepository;

    @GetMapping("/{id}")
    @Transactional(readOnly = true)
    public ServerSuccessResponse<FindPlaceResponse> find(@PathVariable Long id) {

        final Place place = placeRepository.findById(id)
                .orElseThrow(ExceptionCode.ENTITY_NOT_FOUND_FAIL::wrap);
        
        return new ServerSuccessResponse<>(new FindPlaceResponse(PlaceDto.of(place)));
    }

}
