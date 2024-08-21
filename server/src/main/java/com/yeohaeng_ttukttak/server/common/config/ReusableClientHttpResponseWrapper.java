package com.yeohaeng_ttukttak.server.common.config;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.client.ClientHttpResponse;

public class ReusableClientHttpResponseWrapper implements ClientHttpResponse {

    private final ClientHttpResponse response;
    private byte[] body;

    public ReusableClientHttpResponseWrapper(ClientHttpResponse response) throws IOException {
        this.response = response;
        this.body = response.getBody().readAllBytes(); // 응답 바디를 바이트 배열로 읽어들임
    }

    @Override
    public InputStream getBody() throws IOException {
        return new ByteArrayInputStream(body); // 바디를 다시 읽을 수 있도록 ByteArrayInputStream으로 반환
    }

    @Override
    public HttpHeaders getHeaders() {
        return response.getHeaders();
    }

    @Override
    public HttpStatusCode getStatusCode() throws IOException {
        return response.getStatusCode();
    }

    @Override
    public String getStatusText() throws IOException {
        return response.getStatusText();
    }

    @Override
    public void close() {
        response.close();
    }
}
