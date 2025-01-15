package com.yeohaeng_ttukttak.server.domain.travel.exception;

import com.yeohaeng_ttukttak.server.common.exception.exception.fail.ArgumentNotInRangeFailException;

/**
 * <code>MotivationType</code> 개수가 잘못된 경우 발생하는 예외 클래스입니다.
 *
 * <ul>
 *   <li>1개 미만, 혹은 5개를 초과하는 경우 예외가 발생합니다.</li>
 * </ul>
 *
 * <pre><code>
 * if (motivationTypes.size() < 1 || motivationTypes.size() > 5) {
 *     throw new InvalidTravelMotivationSizeFailException();
 * }
 * </code></pre>
 *
 */
public final class InvalidTravelMotivationSizeFailException extends ArgumentNotInRangeFailException {

    public InvalidTravelMotivationSizeFailException() {
        super("motivationTypes", 1, 5);
    }

}
