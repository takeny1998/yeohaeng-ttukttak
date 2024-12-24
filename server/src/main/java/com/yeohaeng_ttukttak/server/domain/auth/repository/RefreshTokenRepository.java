package com.yeohaeng_ttukttak.server.domain.auth.repository;

import com.yeohaeng_ttukttak.server.domain.auth.entity.RefreshToken;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RefreshTokenRepository extends CrudRepository<RefreshToken, String> {

    List<RefreshToken> findAllByMemberId(String memberId);

}
