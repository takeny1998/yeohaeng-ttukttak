package com.yeohaeng_ttukttak.server.notification.service;

import com.google.firebase.messaging.*;
import com.yeohaeng_ttukttak.server.notification.dto.SendAllCommand;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class FcmNotificationService implements NotificationService {

    private final FirebaseMessaging instance;

    @Override
    public void sendAll(SendAllCommand command) {

        final Notification notification = Notification.builder()
                .setTitle(command.title())
                .setBody(command.body())
                .build();

        final Aps aps = Aps.builder()
                .setContentAvailable(true)
                .build();

       final ApnsConfig apnsConfig = ApnsConfig.builder()
                .setAps(aps).build();

        final MulticastMessage message = MulticastMessage.builder()
                .setNotification(notification)
                .setApnsConfig(apnsConfig)
                .addAllTokens(command.tokens())
                .putAllData(command.data())
                .build();

        try {

            final BatchResponse response = instance.sendEachForMulticast(message);

            log.debug("[FcmNotificationService.sendAll] Notification has been sent. Total: {}, Success: {}, Fail: {}",
                    response.getResponses().size(), response.getSuccessCount(), response.getFailureCount());

        } catch (FirebaseMessagingException e) {

            log.error("[FcmNotificationService.sendAll] Failed to send notification. Error Code: {}, Message: {}",
                    e.getMessagingErrorCode(), e.getMessage());

            throw new RuntimeException(e);
        }

    }
}
