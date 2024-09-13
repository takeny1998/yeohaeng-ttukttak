import 'dart:async';

import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:application/features/notification/presentation/provider/notification_state_notifier.dart';
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

Future<void> notificationConsumeHandler(
    RemoteMessage message, WidgetRef ref) async {
  print(
      '[notificationConsumeHandler] id = ${message.messageId} data = ${message.data}, body = ${message.notification?.body}');

  final model = NotificationModel.fromRemoteMessage(message);
  ref.read(notificationStateNotifierProvider.notifier).handle(model);
}

Future<void> notificationRegisterHandler(
    RemoteMessage message, WidgetRef ref) async {
  print(
      '[notificationRegisterHandler] id = ${message.messageId} data = ${message.data}, body = ${message.notification?.body}');

  final model = NotificationModel.fromRemoteMessage(message);
  ref.read(notificationStateNotifierProvider.notifier).register(model);
}

@pragma('vm:entry-point')
Future<void> notificationBackgroundHandler(
    RemoteMessage message, ProviderContainer container) async {
  print(
      '[notificationBackgroundHandler] id = ${message.messageId} data = ${message.data}, body = ${message.notification?.body}');

  final model = NotificationModel.fromRemoteMessage(message);
  container.read(notificationStateNotifierProvider.notifier).register(model);
}

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
      alert: true,
      badge: true,
      criticalAlert: true,
      provisional: false,
      sound: true);

  // iOS foreground notification 권한
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  //fetch the FCM token for this device
  final fcmToken = await FirebaseMessaging.instance.getToken();

  return fcmToken.toString();
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

  final container = ProviderContainer(overrides: [
    baseDeviceInfoProvider.overrideWithValue(deviceInfo),
    notificationTokenProvider.overrideWithValue(fcmToken),
  ]);

  FirebaseMessaging.onBackgroundMessage(
      (message) => notificationBackgroundHandler(message, container));

  runApp(ProviderScope(parent: container, child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  StreamSubscription<RemoteMessage>? onMessage, onMessageOpenedApp;

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router);
  }

  @override
  void initState() {
    super.initState();
    // 푸시 알림이 그냥 도착했을 때 동작한다.
    onMessage = FirebaseMessaging.onMessage
        .listen((message) => notificationRegisterHandler(message, ref));

    // 푸시 알림을 받고, 사용자가 직접 클릭했을 때 동작한다.
    onMessageOpenedApp = FirebaseMessaging.onMessageOpenedApp
        .listen((message) => notificationConsumeHandler(message, ref));

    // 앱이 종료(terminated)된 상태에서,
    // 사용자가 Push Notification을 클릭해 들어올 때 발생한다,
    FirebaseMessaging.instance.getInitialMessage().then((initialMessage) async {

      print('[main] initialMessage = ${initialMessage?.messageId} ${initialMessage?.data} ');
      if (initialMessage == null) return;

      final notification = NotificationModel.fromRemoteMessage(initialMessage);
      print('[if initialMessage not null] notification = $notification');

      await ref
          .read(notificationStateNotifierProvider.notifier)
          .register(notification);
    });
  }

  @override
  void dispose() {
    onMessage?.cancel();
    onMessageOpenedApp?.cancel();

    super.dispose();
  }
}
