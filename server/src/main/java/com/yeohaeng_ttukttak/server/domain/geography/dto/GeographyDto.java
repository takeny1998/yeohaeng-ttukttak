package com.yeohaeng_ttukttak.server.domain.geography.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.yeohaeng_ttukttak.server.domain.geography.entity.Geography;
import com.yeohaeng_ttukttak.server.domain.image.dto.ImageDto;
import org.springframework.context.i18n.LocaleContextHolder;

import java.util.Locale;
import java.util.Objects;

/**
 * 아래와 같은 지역 정보를 포괄적으로 표현하는 DTO 객체입니다.
 *
 * <ul>
 *     <li>국가 (Country) : 한 국가를 일컫는 도메인 객체 (대한민국, 일본 등)</li>
 *     <li>지역 (Province): 광역자치단체를 일컫는 도메인 객체 (도, 광역시, 특별시)</li>
 *     <li>도시 (City): 지방자치단체를 일컫는 도메인입니다.(시, 군, 구)</li>
 * </ul>
 *
 * @param id 식별자
 * @param level 세분된 지역 정보의 구분자
 *              <table>
 *                  <tr>
 *                      <th scope="col" ></th>
 *                      <th scope="col" >Country</th>
 *                      <th scope="col" >Province</th>
 *                      <th scope="col" >City</th>
 *                  </tr>
 *                  <tr>
 *                      <td>level</td>
 *                      <td><center>0</center></td>
 *                      <td><center>1</center></td>
 *                      <td><center>2</center></td>
 *                  </tr>
 *              </table>
 * @param parentId 상위 지역의 식별자; 없는 경우 null
 * @param name 지역의 전체 이름
 * @param shortName 간략화된 지역 이름
 * @param insignia 지역 Ci 정보
 */
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public record GeographyDto(
        Long id,
        String level,
        Long parentId,
        String name,
        String shortName,
        ImageDto insignia
) {

    public static GeographyDto of(Geography geography) {
        final Locale locale = LocaleContextHolder.getLocale();

        final Long parentId = Objects.nonNull(geography.parent())
                ? geography.parent().id()
                : null;

        final ImageDto insignia = Objects.nonNull(geography.insignia())
                ? ImageDto.of(geography.insignia())
                : null;

        return new GeographyDto(
                geography.id(),
                String.valueOf(geography.level()),
                parentId,
                geography.name(locale),
                geography.shortName(locale),
                insignia);
    }

}
