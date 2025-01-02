import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/util/riverpod_extensions.dart';
import 'package:application_new/core/scroll/infinite_scroll_model.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/feature/travel_city_attraction/travel_city_attraction_state.dart';
import 'package:application_new/shared/dto/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_city_attraction_provider.g.dart';

@riverpod
class TravelCityAttraction extends _$TravelCityAttraction {

  static const int pageSize = 10;

  @override
  FutureOr<TravelCityAttractionState> build(int travelId, int cityId) async {
    ref.cacheFor(const Duration(minutes: 5));

    final attraction = await _fetchAttraction(0, pageSize);

    return TravelCityAttractionState(attractions: [attraction]);
  }


  Future<InfiniteScrollModel<PlaceModel>> _fetchAttraction(
      int pageNumber, int pageSize) async {

    final Json queryParameters = {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };

    final response = await ref.read(httpServiceProvider).get(
        '/travels/$travelId/cities/$cityId/attractions',
        options: ServerRequestOptions(queryParameters: queryParameters));

    return InfiniteScrollModel.fromJson(response['places'],
        (object) => PlaceModel.fromJson(object as Map<String, dynamic>));
  }
}
