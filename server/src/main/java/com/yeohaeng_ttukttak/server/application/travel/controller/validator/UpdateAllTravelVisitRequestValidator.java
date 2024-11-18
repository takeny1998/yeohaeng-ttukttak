package com.yeohaeng_ttukttak.server.application.travel.controller.validator;


import com.yeohaeng_ttukttak.server.application.travel.controller.dto.UpdateAllTravelVisitRequest;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.UpdateTravelVisitCommand;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import lombok.extern.slf4j.Slf4j;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
public class UpdateAllTravelVisitRequestValidator
        implements ConstraintValidator<ValidateUpdateAllTravelVisitRequest, UpdateAllTravelVisitRequest> {

    @Override
    public boolean isValid(UpdateAllTravelVisitRequest request,
                           ConstraintValidatorContext context) {

        log.debug("request = {}", request);

        if (request == null || request.visits() == null) {
            return true;
        }

        List<UpdateTravelVisitCommand> visits = request.visits();

        // 1. id 값 중복 검사
        Set<Long> visitIds = new HashSet<>();

        log.debug("{}", visitIds);


        for (UpdateTravelVisitCommand visit : visits) {
            if (!visitIds.add(visit.id())) {
                // id 값 중복이 있을 경우
                context.disableDefaultConstraintViolation();
                context.buildConstraintViolationWithTemplate("ID value must be unique").addPropertyNode("visits").addConstraintViolation();
                return false;
            }
        }

        // 2. orderOfVisit, dayOfTravel이 같은 항목이 있을 경우 검사
        Set<String> orderAndDaySet = new HashSet<>();
        for (UpdateTravelVisitCommand visit : visits) {
            String key = visit.orderOfVisit() + "-" + visit.dayOfTravel();
            if (!orderAndDaySet.add(key)) {
                // orderOfVisit, dayOfTravel이 동일한 경우
                context.disableDefaultConstraintViolation();
                context.buildConstraintViolationWithTemplate("orderOfVisit and dayOfTravel must be unique").addPropertyNode("visits").addConstraintViolation();
                return false;
            }
        }

        // 3. orderOfVisit, dayOfTravel이 0 이상인지를 확인
        for (UpdateTravelVisitCommand visit : visits) {
            if (visit.orderOfVisit() < 0 || visit.dayOfTravel() < 0) {
                // 0 이상의 값이 아니면
                context.disableDefaultConstraintViolation();
                context.buildConstraintViolationWithTemplate("orderOfVisit and dayOfTravel must be non-negative").addPropertyNode("visits").addConstraintViolation();
                return false;
            }
        }

        return true;
    }
}