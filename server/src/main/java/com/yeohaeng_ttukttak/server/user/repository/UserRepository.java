package com.yeohaeng_ttukttak.server.user.repository;

import com.yeohaeng_ttukttak.server.user.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u WHERE u.auth.openId = :openId")
    Optional<User> findByOpenId(String openId);

}
