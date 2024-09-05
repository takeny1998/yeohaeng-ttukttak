import 'dart:ui';

import 'package:application/firebase_options.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config/router/router_provider.dart';

part 'main.g.dart';

@riverpod
BaseDeviceInfo baseDeviceInfo(BaseDeviceInfoRef ref) {
  throw UnimplementedError();
}

@riverpod
String notificationToken(NotificationTokenRef ref) {
  throw UnimplementedError();
}

Future<String> initNotifications() async {
  //request permission from user (will prompt user)
  await FirebaseMessaging.instance.requestPermission(
      alert: true, badge: true, provisional: false, sound: true);

  // iOS foreground notification 권한
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('[FirebaseMessaging.onMessage.listen] data = ${message.data}, notification = ${message.notification}');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('[FirebaseMessaging.onMessageOpenedApp.listen] data = ${message.data}, notification = ${message.notification}');
  });

  PlatformDispatcher.instance.onError = (error, stack) {
    print('[PlatformDispatcher.instance.onError] $error');
    return true;
  };

  //fetch the FCM token for this device
  final fcmToken = await FirebaseMessaging.instance.getToken();

  return fcmToken.toString();
}

// backgroundHandler must be a top-level function
// (e.g. not a class method which requires initialization).
Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint('fcm backgroundHandler, message');

  debugPrint(message.notification?.title ?? '');
  debugPrint(message.notification?.body ?? '');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  print('[main()] firebaseApp: options = ${firebaseApp.options}');

  final fcmToken = await initNotifications();
  print('[main()] fcmToken: $fcmToken');

  final deviceInfo = await DeviceInfoPlugin().deviceInfo;

  runApp(ProviderScope(overrides: [
    baseDeviceInfoProvider.overrideWithValue(deviceInfo),
    notificationTokenProvider.overrideWithValue(fcmToken),
  ], child: const MyApp()));
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
