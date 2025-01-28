package com.yeohaeng_ttukttak.server.application.participant.service;

import com.yeohaeng_ttukttak.server.application.participant.service.dto.ParticipantDto;
import com.yeohaeng_ttukttak.server.application.participant.service.dto.ParticipantTokenDto;

import com.yeohaeng_ttukttak.server.common.authorization.AuthorizationBuilder;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.jwt.dto.JwtClaim;
import com.yeohaeng_ttukttak.server.domain.jwt.service.JwtService;
import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.member.repository.MemberRepository;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipantToken;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelParticipantRepository;
import com.yeohaeng_ttukttak.server.domain.travel.repository.TravelRepository;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelCreatorRole;
import com.yeohaeng_ttukttak.server.domain.travel.role.TravelParticipantRole;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.util.Map;
import java.util.Optional;

import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.ENTITY_NOT_FOUND_FAIL;
import static com.yeohaeng_ttukttak.server.common.exception.ExceptionCode.INVITATION_INVALID_OR_EXPIRED_FAIL;

@Slf4j
@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class ParticipantService {

    private final JwtService jwtService;

    private final TravelRepository travelRepository;

    private final MemberRepository memberRepository;

    private final TravelParticipantRepository participantRepository;

    private static final String SECRET = "sample", ISSUER = "yeohaeng-ttukttak.com";

    private static final Duration EXPIRATION = Duration.ofMinutes(30);

    @Transactional(readOnly = true)
    public ParticipantTokenDto createToken(
            final Long travelId, final String inviterId) {

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        final Member inviter = memberRepository.findByUuid(inviterId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        new AuthorizationBuilder(inviter.uuid())
                .or(new TravelCreatorRole(travel))
                .or(new TravelParticipantRole(travel))
                .authorize();

        final TravelParticipantToken participantToken = new TravelParticipantToken(travel, inviter);

        final Map<String, Object> claims = Map.of(
                "uuid", participantToken.getUuid(),
                "travelId", participantToken.getTravel().id(),
                "inviterId", participantToken.getInviter().uuid());

        final String encodedToken =
                jwtService.issueByHS256(SECRET, ISSUER, EXPIRATION, claims);

        return new ParticipantTokenDto(encodedToken, EXPIRATION.getSeconds());
    }

    @Transactional(readOnly = true)
    public ParticipantDto findById(final Long participantId) {

        final TravelParticipant participant = participantRepository
                .findById(participantId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        return ParticipantDto.of(participant);
    }

    @Transactional
    public Long assignInvitee(final String encodedToken, final String inviteeId) {

        final Map<String, JwtClaim> claims =
                jwtService.verifyByHS256(encodedToken, SECRET, ISSUER);

        final String uuid = Optional
                .ofNullable(claims.get("uuid"))
                .map(JwtClaim::asString)
                .orElseThrow(INVITATION_INVALID_OR_EXPIRED_FAIL::wrap);

        final Long travelId = Optional
                .ofNullable(claims.get("travelId"))
                .map(JwtClaim::asInteger)
                .map(Integer::longValue)
                .orElseThrow(INVITATION_INVALID_OR_EXPIRED_FAIL::wrap);

        final String inviterId = Optional
                .ofNullable(claims.get("inviterId"))
                .map(JwtClaim::asString)
                .orElseThrow(INVITATION_INVALID_OR_EXPIRED_FAIL::wrap);

        final Travel travel = travelRepository.findById(travelId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        final Member inviter = memberRepository.findByUuid(inviterId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        final Member invitee = memberRepository.findByUuid(inviteeId)
                .orElseThrow(ENTITY_NOT_FOUND_FAIL::wrap);

        final TravelParticipantToken participantToken =
                new TravelParticipantToken(uuid, travel, inviter);

        final TravelParticipant participant =
                new TravelParticipant(participantToken, invitee);

        participantRepository.save(participant);

        return participant.getId();
    }


}
