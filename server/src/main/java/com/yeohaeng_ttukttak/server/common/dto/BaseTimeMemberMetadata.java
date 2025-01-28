package com.yeohaeng_ttukttak.server.common.dto;

import com.yeohaeng_ttukttak.server.domain.member.entity.Member;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeEntity;
import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeMemberEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.annotation.Nullable;
import lombok.EqualsAndHashCode;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.Optional;


@Schema(description = "시간 및 사용자 메타 데이터를 표현하는 DTO 객입니다.")
@EqualsAndHashCode(callSuper = false)
public class BaseTimeMemberMetadata extends BaseTimeMetadata {

    @Nullable
    private final String lastModifiedBy;

    private final String createdBy;

    protected BaseTimeMemberMetadata(@Nullable final LocalDateTime lastModifiedAt,
                                   final LocalDateTime createdAt,
                                   @Nullable final String lastModifiedBy,
                                   final String createdBy) {
        super(lastModifiedAt, createdAt);

        this.lastModifiedBy = lastModifiedBy;
        this.createdBy = createdBy;
    }

    public static BaseTimeMemberMetadata of (final BaseTimeMemberEntity entity) {

        final String lastModifiedBy = Optional
                .ofNullable(entity.lastModifiedBy())
                .map(Member::uuid)
                .orElse(null);

        return new BaseTimeMemberMetadata(
                entity.lastModifiedAt(), entity.createdAt(),
                lastModifiedBy,
                entity.createdBy().uuid());
    }

    @Nullable
    @Schema(description = "마지막으로 수정한 사용자의 UUID. 수정한 사람이 없으면 null 입니다.",
            example = "cbWnioiMSJWxiNwsQmmyCA",
            nullable = true)
    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    @Schema(description = "생성한 사용자의 UUID.", example = "GA4MNNPrS5q2VW8RJGSSLQ")
    public String getCreatedBy() {
        return createdBy;
    }
}
