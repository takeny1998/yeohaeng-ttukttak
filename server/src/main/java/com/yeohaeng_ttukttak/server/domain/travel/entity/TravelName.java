package com.yeohaeng_ttukttak.server.domain.travel.entity;

import com.yeohaeng_ttukttak.server.common.exception.exception.FailException;
import com.yeohaeng_ttukttak.server.common.exception.ExceptionCode;
import com.yeohaeng_ttukttak.server.common.locale.RequestLocaleService;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Province;
import jakarta.persistence.Embeddable;
import jakarta.persistence.Transient;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.stream.Collectors;

@ToString
@Embeddable
@EqualsAndHashCode
@Configurable(autowire = Autowire.BY_TYPE, preConstruction = true)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TravelName {

    @Autowired @Transient
    private RequestLocaleService requestLocaleService;

    private String name;

    private boolean isGenerated;

    /**
     * 입력받은 <code>inputName</code>의 <code>null</code> 여부에 따라 여행 이름을 생성합니다.
     *
     * <pre>{@code
     *  if (inputName == null) generateDefaultName(cities);
     *  else validateInputName(inputName);
     * }</pre>
     *
     * @param inputName 사용할 여행 이름
     * @param cities 지정한 도시 목록
     *
     * @see TravelName#updateName(String)
     */
    public TravelName(final String inputName, final List<City> cities) {

        if (Objects.isNull(inputName)) {
            this.name = generateDefaultName(cities);
            this.isGenerated = true;
            return;
        }

        updateName(inputName);
    }

    public String name() {
        return name;
    }

    public boolean isGenerated() {
        return isGenerated;
    }

    /**
     * 자동 생성된 이름일 경우 이름을 재생성 합니다. 아닌 경우 동작하지 않습니다.
     *
     * @param travelCities 새로운 도시 목록
     */
     void regenerateDefaultName(final List<TravelCity> travelCities) {

        if (!isGenerated) return;

        this.name = generateDefaultName(travelCities.stream()
                .map(TravelCity::city)
                .toList());

    }


    /**
     * 입력된 이름의 유효성을 검사한 뒤 객체로 만들어 반환한다.
     *
     * @param inputName 검사할 이름
     * @throws FailException 이름이 100Byte(EUC-KR 기준)가 넘으면 발생한다.
     * @throws FailException 이름에 한글, 영어, 숫자, 콤마가 아닌 글자가 들어간 경우 발생한다.
     */
    void updateName(final String inputName) {
        if (Objects.isNull(inputName)) {
            throw ExceptionCode.INVALID_TRAVEL_NAME_CHARACTER_FAIL.wrap();
        }

        int byteCount = StringUtil.getByteLengthInEucKr(inputName);

        if (byteCount > 100) {
            throw ExceptionCode.TRAVEL_NAME_TOO_LONG_FAIL.wrap();
        }

        final boolean hasCharOrNumberOrComma =
                inputName.matches("^[가-힣a-zA-Z1-9,\\s]+$");

        if (!hasCharOrNumberOrComma) {
            throw ExceptionCode.INVALID_TRAVEL_NAME_CHARACTER_FAIL.wrap();
        }

        this.name = inputName;
        this.isGenerated = false;

    }

    /**
     * <pre>
     * 선택한 도시의 지역 이름을 모아 이름을 생성한다.
     *
     * - <b>중구,도봉구,강남구</b>: 서울 여행 (Travel to Seoul)
     * - <b>중구,수원시</b>: 서울, 경기 여행 (Travel To Seoul, Gyeonggi)
     * </pre>
     * @param cities 선택한 도시 목록
     * @return 생성된 TravelName 엔티티
     */
    public String generateDefaultName(List<City> cities) {

        final Locale locale = requestLocaleService.getCurrentLocale();

        final List<Province> provinces = cities.stream()
                .map(City::province)
                .distinct()
                .toList();

        final String generatedName = provinces.stream()
                .map(province -> province.shortName(locale))
                .collect(Collectors.joining(", "));

        if (Objects.equals(locale, Locale.ENGLISH)) {
            return String.format("%s %s", "Travel to", generatedName);
        }

        return String.format("%s %s", generatedName, "여행");
    }


}
