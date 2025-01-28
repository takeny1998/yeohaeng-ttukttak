package com.yeohaeng_ttukttak.server.common.dto;

import com.yeohaeng_ttukttak.server.domain.shared.entity.BaseTimeEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.annotation.Nullable;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@Schema(description = "시간 메타 데이터를 표현하는 DTO 객체입니다.")
@EqualsAndHashCode
public class BaseTimeMetadata {

    @Nullable
    private final LocalDateTime lastModifiedAt;

    private final LocalDateTime createdAt;

    protected BaseTimeMetadata(@Nullable final LocalDateTime lastModifiedAt,
                               final LocalDateTime createdAt) {
        this.lastModifiedAt = lastModifiedAt;
        this.createdAt = createdAt;
    }

    public static BaseTimeMetadata of (final BaseTimeEntity baseTimeEntity) {
        return new BaseTimeMetadata(baseTimeEntity.lastModifiedAt(), baseTimeEntity.createdAt());
    }

    @Nullable
    @Schema(description = "마지막에 수정된 일시. 한번도 수정되지 않았으면 null 입니다.",
            example = "2024-12-14T12:59:12.478731",
            nullable = true)
    public LocalDateTime getLastModifiedAt() {
        return lastModifiedAt;
    }

    @Schema(description = "처음 생성된 일시.", example = "2024-12-14T12:56:32.828479")
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
}
