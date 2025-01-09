package com.yeohaeng_ttukttak.server.domain.travel_name;

import com.yeohaeng_ttukttak.server.common.aop.CrudPermission;
import com.yeohaeng_ttukttak.server.common.aop.annotation.Authorization;
import com.yeohaeng_ttukttak.server.common.util.StringUtil;
import com.yeohaeng_ttukttak.server.domain.geography.entity.City;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Province;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelCity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class TravelNameService {

    /**
     * <pre>
     * 생성한 여행의 이름을 초기화합니다.
     *
     * - 이름을 지정한 경우 이름을 검증한 뒤 할당합니다.
     * - 지정하지 않은 경우 선택한 도시에 따라 이름을 생성합니다.
     * </pre>
     * @param locale 현재 요청의 Locale 정보
     * @param travel 생성한 여행 정보
     * @param inputName 입력한 여행 이름
     * @throws IllegalStateException 여행이 이름이 이미 초기화된 경우 발생한다.
     */
    @Transactional
    public void initializeName(Locale locale, Travel travel, String inputName) {

        // 이미 이름이 할당된 경우 예외를 발생한다.
        if (Objects.nonNull(travel.name())) {
            throw new IllegalStateException("이미 이름이 여행에 초기화 되었습니다.");
        }

        if (Objects.isNull((inputName))) {
            travel.rename(this.generateDefaultName(locale, travel.cities()));
            return;
        }

        travel.rename(this.validateInputName(inputName));

    }

    @Transactional
    public void applyName(Travel travel, String inputName, String memberId) {

        if (Objects.isNull(inputName)) {
            return;
        }

        travel.verifyParticipantsOrCreator(memberId);

        final TravelName newName = validateInputName(inputName);
        travel.rename(newName);

    }

    /**
     * <pre>
     * 여행의 변경 사항을 반영해 이름을 변경합니다. 이름이 자동 생성된 경우만 변경합니다.
     * </pre>
     * @param travel 변경할 여행 엔티티
     * @throws IllegalStateException 여행 이름이 초기화되지 않은 경우 발생한다.
     */
    @Transactional
    @Authorization(requires = { CrudPermission.CREATE, CrudPermission.UPDATE})
    public void applyChangeToName(Locale locale, Travel travel) {

        final Boolean travelNameGenerated = travel.isNameGenerated();

        if (Objects.isNull(travelNameGenerated)) {
            throw new IllegalStateException("여행 이름이 초기화되지 않았습니다.");
        }

        // 이미 지정한 이름이 있는 경우 바로 종료한다.
        if (!travelNameGenerated) return;

        travel.rename(this.generateDefaultName(locale, travel.cities()));

    }
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
    public TravelName generateDefaultName(Locale locale, List<TravelCity> cities) {
        final List<Province> provinces = cities.stream()
                .map(TravelCity::city)
                .map(City::province)
                .distinct()
                .toList();

        final String generatedName = provinces.stream()
                .map(province -> province.shortName(locale))
                .collect(Collectors.joining(", "));

        if (Objects.equals(locale, Locale.ENGLISH)) {
            return new TravelName(String.format("%s %s", "Travel to", generatedName), true);
        }

        return new TravelName(String.format("%s %s", generatedName, "여행"), true);
    }

}
