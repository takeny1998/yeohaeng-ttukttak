package com.yeohaeng_ttukttak.server.common.util;

import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

public class KeyUtils {

    public static PrivateKey generatePrivateKey(String privateKey) throws InvalidKeySpecException, NoSuchAlgorithmException {
        byte[] keyBytes = Base64.getDecoder().decode(privateKey);

        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("EC");

        return keyFactory.generatePrivate(keySpec);
    }

}
