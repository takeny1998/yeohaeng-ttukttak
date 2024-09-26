import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/log/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/region_model.dart';

part 'region_provider.g.dart';

@Riverpod(keepAlive: true)
class Region extends _$Region {
  @override
  List<RegionModel> build() {
    _init();
    return [];
  }

  Future<void> _init() async {
    final httpService = ref.read(httpServiceProvider);

    final response = await httpService.request('GET', '/api/v2/regions');

    state = List.from(response['regions'])
        .map((e) => RegionModel.fromJson(e))
        .toList();

  }
}
