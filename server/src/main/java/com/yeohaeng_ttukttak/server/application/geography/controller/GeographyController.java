package com.yeohaeng_ttukttak.server.application.geography.controller;

import com.yeohaeng_ttukttak.server.application.geography.controller.dto.GeographyListResponse;
import com.yeohaeng_ttukttak.server.common.dto.ServerResponse;
import com.yeohaeng_ttukttak.server.domain.geography.dto.GeographyDto;
import com.yeohaeng_ttukttak.server.domain.geography.repository.GeographyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v2/geographies")
@RequiredArgsConstructor
public class GeographyController {

    private final GeographyRepository geographyRepository;

    /**
     * 모든 지역 정보(국가, 지역, 도시) 목록을 반환합니다.
     *
     * <ul>
     *     <li>해당 데이터는 변경될 여지가 적으므로, 적절히 캐시해 사용하기를 권장합니다.</li>
     * </ul>
     *
     * @return 조회된 지역 정보 목록
     */
    @GetMapping
    @Transactional(readOnly = true)
    public ServerResponse<GeographyListResponse> findAll() {

       final List<GeographyDto> dtoList =
               geographyRepository.findAll()
                       .stream()
                       .map(GeographyDto::of)
                       .toList();

        return new ServerResponse<>(new GeographyListResponse(dtoList));

    }

}
