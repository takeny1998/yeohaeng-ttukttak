package com.yeohaeng_ttukttak.server.token.provider.java_jwt;

import com.auth0.jwk.JwkException;
import com.auth0.jwk.JwkProvider;
import com.auth0.jwt.interfaces.RSAKeyProvider;
import com.yeohaeng_ttukttak.server.token.exception.JwtSignatureFailedException;
import lombok.RequiredArgsConstructor;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

@RequiredArgsConstructor
public class JavaJwtRsaKeyProvider implements RSAKeyProvider {

    private final JwkProvider jwkProvider;

    @Override
    public RSAPublicKey getPublicKeyById(String keyId) {
        try {
            return (RSAPublicKey) jwkProvider.get(keyId).getPublicKey();
        } catch (JwkException e) {
            throw new JwtSignatureFailedException(e);
        }
    }

    @Override
    public RSAPrivateKey getPrivateKey() {
        throw new UnsupportedOperationException();
    }

    @Override
    public String getPrivateKeyId() {
        throw new UnsupportedOperationException();
    }

}
