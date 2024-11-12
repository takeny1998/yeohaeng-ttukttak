import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:application_new/shared/repository/travel_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_provider.g.dart';

@riverpod
class Travel extends _$Travel {

  @override
  TravelModel? build(int id) {
    ref.watch(travelRepositoryProvider).find(id)
        .then((travel) => state = travel);

    return null;
  }
}
