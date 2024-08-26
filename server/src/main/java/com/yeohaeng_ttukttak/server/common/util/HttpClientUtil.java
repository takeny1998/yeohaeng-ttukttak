package com.yeohaeng_ttukttak.server.common.util;

import org.springframework.web.service.invoker.HttpExchangeAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;

public class HttpClientUtil {

    public static <T> T createClient(HttpExchangeAdapter adapter, Class<T> clientType) {

        HttpServiceProxyFactory factory = HttpServiceProxyFactory
                .builderFor(adapter)
                .build();

        return factory.createClient(clientType);

    }

}
