package com.yeohaeng_ttukttak.server.application.travel.service;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;
import com.yeohaeng_ttukttak.server.common.exception.exception.fail.EntityNotFoundException;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelVisitDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.MemberTravel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelVisit;
import com.yeohaeng_ttukttak.server.domain.travel.repository.MemberTravelRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
@Service
@RequiredArgsConstructor
public class UpdateAllTravelVisitService {

    private final MemberTravelRepository travelRepository;

    @Transactional
    public List<TravelVisitDto> call(Long travelId, List<UpdateTravelVisitCommand> commands) {
        // 여행 데이터를 가져오기
        MemberTravel travel = travelRepository.findById(travelId)
                .orElseThrow(() -> new EntityNotFoundException(Travel.class));

        // 명령어 맵핑 (ID -> Command)
        final Map<Long, UpdateTravelVisitCommand> commandMap = mapCommandsById(commands);

        deleteVisitsNotInCommands(travel, commandMap);
        updateTravelVisits(travel, commandMap);

        return travel.visits().stream()
                .map(TravelVisitDto::of)
                .toList();
    }

    private Map<Long, UpdateTravelVisitCommand> mapCommandsById(List<UpdateTravelVisitCommand> commands) {
        return commands.stream()
                .collect(Collectors.toMap(UpdateTravelVisitCommand::id, Function.identity()));
    }

    private void deleteVisitsNotInCommands(MemberTravel travel, Map<Long, UpdateTravelVisitCommand> commandMap) {
        List<TravelVisit> visitsToRemove = travel.visits().stream()
                .filter(visit -> !commandMap.containsKey(visit.id()))
                .toList();

        visitsToRemove.forEach(visit -> travel.removeVisit(visit.id()));
    }

    private void updateTravelVisits(MemberTravel travel, Map<Long, UpdateTravelVisitCommand> commandMap) {
        travel.visits().forEach(visit -> {
            UpdateTravelVisitCommand command = commandMap.get(visit.id());
            if (command != null) {
                visit.setOrderOfVisit(command.orderOfVisit())
                        .setDayOfTravel(command.dayOfTravel());
            }
        });
    }

}
