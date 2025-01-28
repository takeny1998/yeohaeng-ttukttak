package com.yeohaeng_ttukttak.server.domain.shared.entity;

import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseTimeEntity {

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @Nullable
    @LastModifiedDate
    private LocalDateTime lastModifiedAt;

    public LocalDateTime createdAt() {
        return createdAt;
    }

    @Nullable
    public LocalDateTime lastModifiedAt() {
        return lastModifiedAt;
    }

}
