package com.yeohaeng_ttukttak.server.common.util.my_jwt;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeohaeng_ttukttak.server.common.util.my_jwt.exception.*;
import lombok.NoArgsConstructor;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.Instant;
import java.util.Map;
import java.util.Optional;

import static com.yeohaeng_ttukttak.server.common.util.MyStringUtil.fromBase64Url;
import static com.yeohaeng_ttukttak.server.common.util.MyStringUtil.toBase64Url;
import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public class MyJwtUtil {

    private static final String SIGNATURE_ALGORITHM = "HmacSHA256";
    private static final ObjectMapper objectMapper = new ObjectMapper();
    private static final String HEADER = "eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYifQ";

    /**
     * 제공된 비밀 키와 클레임을 기반으로 JWT 토큰을 생성합니다. HmacSHA256 해시 함수로 서명을 생성합니다.
     *
     * @param secret 토큰 서명에 사용될 비밀 키
     * @param claims 토큰 페이로드에 포함될 클레임
     * @return 생성된 JWT 토큰
     */
    public static String issue(String secret, Map<String, Object> claims) {
        String content = HEADER + "." + serialize(claims);
        String signature = generateSignature(secret, content);
        return content + "." + signature;
    }

    private static String generateSignature(String secret, String content) {
        try {
            Mac mac = Mac.getInstance(SIGNATURE_ALGORITHM);
            SecretKeySpec secretKeySpec = new SecretKeySpec(secret.getBytes(), SIGNATURE_ALGORITHM);
            mac.init(secretKeySpec);
            byte[] signatureBytes = mac.doFinal(content.getBytes());
            return toBase64Url(signatureBytes);
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new TokenSignatureException();
        }
    }

    /**
     * HmacSHA256으로 서명된 JWT 토큰을 검증 후 해독 합니다.
     *
     * @param secret 토큰 서명 검증에 사용될 비밀 키
     * @param token  검증하고 디코딩할 JWT 토큰
     * @return 토큰의 페이로드를 나타내는 맵(Map)
     * @throws TokenSignatureNotMatchedException 토큰의 서명이 예상된 서명과 일치하지 않는 경우
     * @throws InvalidTokenException             토큰 형식이 올바르지 않은 경우
     * @throws ExpiredTokenException             토큰이 만료된 경우
     */
    public static Map<String, Object> validateAndDecode(String secret, String token) {

        String[] parts = splitToken(token);

        String content = parts[0] + "." + parts[1];
        String signature = parts[2];

        if (!generateSignature(secret, content).equals(signature)) {
            throw new TokenSignatureNotMatchedException();
        }

        Map<String, Object> payload = decode(parts[1]);

        validateExpiration(payload);

        return payload;
    }

    public static Map<String, Object> decode(String token) {
        try {

            String[] parts = splitToken(token);

            return objectMapper.readValue(fromBase64Url(parts[1]), new TypeReference<>() {
            });
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    private static String serialize(Object object) {
        try {
            String json = objectMapper.writeValueAsString(object);
            return toBase64Url(json.getBytes());
        } catch (JsonProcessingException e) {
            throw new TokenSerializationException();
        }
    }

    private static void validateExpiration(Map<String, Object> payload) {
        Instant expiration = Optional.ofNullable(payload.get("exp"))
                .map(value -> Instant.ofEpochSecond(Long.parseLong(value.toString())))
                .orElseThrow(InvalidTokenException::new);

        if (expiration.isBefore(Instant.now())) {
            throw new ExpiredTokenException();
        }
    }

    private static String[] splitToken(String token) {
        String[] parts = token.split("\\.");

        if (parts.length != 3) {
            throw new InvalidTokenException();
        }

        return parts;
    }
}
