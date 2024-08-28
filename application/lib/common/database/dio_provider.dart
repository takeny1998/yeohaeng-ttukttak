
import 'package:application/main.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {

  final baseDeviceInfo = ref.watch(baseDeviceInfoProvider);

  final {'identifierForVendor': deviceId, 'name': deviceName } = baseDeviceInfo.data;

  return Dio(BaseOptions(
    headers: {
      'Device-Id': deviceId,
      'Device-Name': deviceName
    }
  ));

}