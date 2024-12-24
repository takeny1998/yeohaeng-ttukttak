package com.yeohaeng_ttukttak.server.domain.travel_name;

import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Province;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class TravelNameService {

    /**
     * 입력된 이름의 유효성을 검사한 뒤 객체로 만들어 반환한다.
     * @param inputName 검사할 이름
     * @return 변환된 TravelName 엔티티
     * @throws TravelNameTooLongFailException 이름이 100Byte(EUC-KR 기준)가 넘으면 발생한다.
     * @throws InvalidTravelNameCharacterFailException 이름에 한글, 영어, 숫자, 콤마가 아닌 글자가 들어간 경우 발생한다.
     */
    public TravelName validateInputName(String inputName) {

        int byteCount = StringUtil.getByteLengthInEucKr(inputName);

        if (byteCount > 100) {
            throw new TravelNameTooLongFailException();
        }

        final boolean hasCharOrNumberOrComma =
                inputName.matches("^[가-힣a-zA-Z1-9,\\s]+$");

        if (!hasCharOrNumberOrComma) {
            throw new InvalidTravelNameCharacterFailException();
        }

        return new TravelName(inputName);

    }

    /**
     * <pre>
     * 선택한 도시의 지역 이름을 모아 이름을 생성한다.
     *
     * - <b>중구,도봉구,강남구</b>: 서울 여행 (Travel to Seoul)
     * - <b>중구,수원시</b>: 서울, 경기 여행 (Travel To Seoul, Gyeonggi)
     * </pre>
     * @param locale 요청의 로케일 정보
     * @param cities 선택한 도시 목록
     * @return 생성된 TravelName 엔티티
     */
    public TravelName generateDefaultName(Locale locale, List<City> cities) {
        final List<Province> provinces = cities.stream()
                .map(City::province)
                .distinct()
                .toList();

        final String generatedName = provinces.stream()
                .map(province -> province.shortName(locale))
                .collect(Collectors.joining(", "));

        if (Objects.equals(locale, Locale.ENGLISH)) {
            return new TravelName(String.format("%s %s", "Travel to", generatedName));
        }

        return new TravelName(String.format("%s %s", generatedName, "여행"));
    }

}
