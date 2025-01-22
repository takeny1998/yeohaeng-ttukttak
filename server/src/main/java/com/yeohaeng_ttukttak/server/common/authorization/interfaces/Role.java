package com.yeohaeng_ttukttak.server.common.authorization.interfaces;

public interface Role {

    boolean checkGrantable(final String memberId);

}
