package com.yeohaeng_ttukttak.server.common.authorization;


import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public record AuthorizationContext(int depth, Set<CrudOperation> requires) {

    public AuthorizationContext() {
        this(0, Set.of());
    }

    public static AuthorizationContext of(CrudOperation[] requires) {
        return new AuthorizationContext(0, toSet(requires));
    }

    public AuthorizationContext proceedWith(CrudOperation[] requires) {

        final Set<CrudOperation> requiresSet =
                Stream.concat(this.requires.stream(),
                                toSet(requires).stream())
                        .collect(Collectors.toSet());

        return new AuthorizationContext(this.depth + 1, requiresSet);

    }

    public AuthorizationContext revert() {
        return new AuthorizationContext(this.depth - 1, requires);
    }

    private static HashSet<CrudOperation> toSet(CrudOperation[] requires) {
        return new HashSet<>(Arrays.asList(requires));
    }

    public CrudOperation[] getRequires() {
        return requires.toArray(new CrudOperation[0]);
    }

}
