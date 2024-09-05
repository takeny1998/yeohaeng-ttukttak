package com.yeohaeng_ttukttak.server.notification.dto;

import java.util.Collection;
import java.util.Map;

public record SendAllCommand(
        Collection<String> tokens, String title, String body, Map<String, String> data) { }
