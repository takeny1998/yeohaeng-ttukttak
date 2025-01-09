package com.yeohaeng_ttukttak.server.common.aop;

import java.util.Arrays;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public record AuthorizationContext(
        int depth,
        Object resourceId,
        Set<CrudPermission> requires
) {

    public AuthorizationContext proceed(
            CrudPermission[] newRequires
    ) {
        return new AuthorizationContext(
                depth + 1,
                resourceId,
                Stream.concat(requires.stream(),
                                Arrays.stream(newRequires))
                        .collect(Collectors.toSet())
        );
    }

    public AuthorizationContext init(Object resourceId) {
        return new AuthorizationContext(
                depth,
                resourceId,
                requires);
    }

    public AuthorizationContext revert() {
        if (depth == 0) return this;
        return new AuthorizationContext(
                depth - 1, resourceId, requires);
    }

    public AuthorizationContext clear() {
        return new AuthorizationContext(0, null, Set.of());
    }

}
