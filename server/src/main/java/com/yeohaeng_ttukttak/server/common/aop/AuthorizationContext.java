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

    public static AuthorizationContext init() {
        return new AuthorizationContext(0, null, Set.of());
    }

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

    public AuthorizationContext resolveId(Object resourceId) {
        return new AuthorizationContext(
                depth,
                resourceId,
                requires);
    }

    public AuthorizationContext revert() {
        return new AuthorizationContext(
                depth - 1, resourceId, requires);
    }

}
