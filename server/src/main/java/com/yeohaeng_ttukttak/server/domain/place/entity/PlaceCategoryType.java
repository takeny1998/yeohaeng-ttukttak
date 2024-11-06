package com.yeohaeng_ttukttak.server.domain.place.entity;

import java.util.List;

public enum PlaceCategoryType {
    nature,
    tourism,
    culture,
    commerce,
    transport,
    dining,
    lodging;

    public static List<PlaceCategoryType> thingsToDo() {
        return List.of(
                PlaceCategoryType.nature,
                PlaceCategoryType.culture,
                PlaceCategoryType.commerce,
                PlaceCategoryType.tourism,
                PlaceCategoryType.transport);
    }
}

// nature, trail -> 자연 관광 (Nature)
// culture, festival -> 문화 시설 (Culture)
// commerce, shop -> 상업 지구 (Commerce)
// landmark, attraction, themePark, recreation -> 관광 명소 (Tourism)
// dining -> 식당/카페 (Dining)
// transport -> 교통 시설 (Transport)
// lodging -> 숙박 시설 (Lodging)