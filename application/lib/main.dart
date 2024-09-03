import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config/router/router_provider.dart';

part 'main.g.dart';

@riverpod
BaseDeviceInfo baseDeviceInfo(BaseDeviceInfoRef ref) {
  throw UnimplementedError();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    print('[main()] $details');
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    print('[PlatformDispatcher.instance.onError] $error');
    return true;
  };

  runApp(ProviderScope(
      overrides: [baseDeviceInfoProvider.overrideWithValue(deviceInfo)],
      child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router);
  }
}
