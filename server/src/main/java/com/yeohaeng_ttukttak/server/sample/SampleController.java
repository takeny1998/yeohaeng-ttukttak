package com.yeohaeng_ttukttak.server.sample;

import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class SampleController {

    private final SampleRepository sampleRepository;

    @Transactional
    @GetMapping("/sample")
    public SampleEntity create(@RequestParam String name) {

        SampleEntity entity = new SampleEntity(name);
        sampleRepository.save(entity);

        return sampleRepository.findById(entity.getId()).get();

    }

}
