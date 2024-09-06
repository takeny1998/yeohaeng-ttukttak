import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:application/features/notification/domain/dao/notification_repository_provider.dart';
import 'package:application/features/notification/presentation/provider/notification_state_provider.dart';
import 'package:application/firebase_options.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
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

  // 푸시 알림이 그냥 도착했을 때 동작한다.
  FirebaseMessaging.onMessage.listen(notificationRegisterHandler);

  // 푸시 알림을 받고, 사용자가 직접 클릭했을 때 동작한다.
  FirebaseMessaging.onMessageOpenedApp.listen(notificationConsumeHandler);

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  //fetch the FCM token for this device
  final fcmToken = await FirebaseMessaging.instance.getToken();

  return fcmToken.toString();
}

// backgroundHandler must be a top-level function
// (e.g. not a class method which requires initialization).
Future<void> backgroundHandler(RemoteMessage message) async {
  // TODO: 백그라운드 메세지를 저장하도록 구현한다.

  print('[backgroundHandler()] id = ${message.messageId} data = ${message.data}, body = ${message.notification?.body}');
}

Future<void> notificationConsumeHandler(RemoteMessage message) async {
  print('[notificationConsumeHandler] id = ${message.messageId} data = ${message.data}, body = ${message.notification?.body}');

  final model = NotificationModel.fromRemoteMessage(message);
  ProviderContainer().read(notificationStateProvider.notifier).handle(model);
}

Future<void> notificationRegisterHandler(RemoteMessage message) async {
  print('[notificationSaveHandler] id = ${message.messageId} data = ${message.data}, body = ${message.notification?.body}');

  final model = NotificationModel.fromRemoteMessage(message);
  ProviderContainer().read(notificationStateProvider.notifier).register(model);
}

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("notifications");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  print('[main()] firebaseApp: options = ${firebaseApp.options}');

  final fcmToken = await initNotifications();
  print('[main()] fcmToken: $fcmToken');

  final deviceInfo = await DeviceInfoPlugin().deviceInfo;
  await initHive();
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
