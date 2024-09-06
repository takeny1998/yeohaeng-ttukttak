import 'package:application/features/notification/data/model/notification_event.dart';
import 'package:application/features/notification/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewLoginDetectedScreen extends ConsumerWidget {

  final String deviceName;

  NewLoginDetectedScreen({super.key, required this.deviceName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('새로운 로그인 시도가 있습니다.'),
          const SizedBox(height: 24),
          Text('기기 이름: $deviceName'),
          const SizedBox(height: 48),
          const Text('당신의 활동이 맞으신가요?'),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.close, color: Colors.red),
                label: const Text('아니요, 계정을 잠급니다.'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.check, color: Colors.green),
                label: const Text('네, 제 활동이 맞습니다.'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
