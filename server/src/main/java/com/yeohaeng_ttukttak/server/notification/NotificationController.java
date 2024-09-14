package com.yeohaeng_ttukttak.server.notification;

import com.yeohaeng_ttukttak.server.notification.dto.SendAllCommand;
import com.yeohaeng_ttukttak.server.notification.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.*;

@Profile({"local", "dev"})
@RestController
@RequestMapping("/dev/notification")
@RequiredArgsConstructor
public class NotificationController {

    private final NotificationService notificationService;

    @PostMapping
    public void sendAll(@RequestBody SendAllCommand command) {
        notificationService.sendAll(command);
    }

}
