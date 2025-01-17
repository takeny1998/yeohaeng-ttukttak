package com.yeohaeng_ttukttak.server.domain.shared.entity;

import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import jakarta.persistence.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseTimeMemberEntity extends BaseTimeEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by")
    @CreatedBy
    private Member createdBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "last_modified_by")
    @LastModifiedBy
    private Member lastModifiedBy;

    public Member createdBy() {
        return createdBy;
    }

    public Member lastModifiedBy() {
        return lastModifiedBy;
    }
}
