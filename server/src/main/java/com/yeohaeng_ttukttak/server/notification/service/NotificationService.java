package com.yeohaeng_ttukttak.server.notification.service;

import com.yeohaeng_ttukttak.server.notification.dto.SendAllCommand;

public interface NotificationService {

    void sendAll(SendAllCommand command);

}
