package com.yeohaeng_ttukttak.server.notification.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.ByteArrayInputStream;
import java.io.IOException;

@Configuration
public class FcmConfiguration {

    @Bean
    public FirebaseApp firebaseApp(FcmProperties fcmProperties) throws IOException {

        byte[] secretKeyBytes = fcmProperties.secretKey().getBytes();

        final GoogleCredentials credentials;

        try (ByteArrayInputStream inputStream = new ByteArrayInputStream(secretKeyBytes)) {

            credentials = GoogleCredentials.fromStream(inputStream);

        }

        final FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(credentials)
                .build();

        return FirebaseApp.initializeApp(options);
    }

    @Bean
    public FirebaseMessaging firebaseMessaging(FirebaseApp firebaseApp) throws IOException {
        return FirebaseMessaging.getInstance(firebaseApp);
    }

}
