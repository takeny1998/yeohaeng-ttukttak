import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void signInApple() async {

    final uri = Uri.https("appleid.apple.com", "/auth/authorize", {
      'client_id': 'com.yeohaeng-ttukttak.application.sign-in',
      'response_mode': 'form_post',
      'response_type': 'code',
      'redirect_uri':  'https://bug-steady-reliably.ngrok-free.app/api/v2/oauth2/apple',
      'scope': 'email name',
      'state': 'action=register'
    });

    final response = await FlutterWebAuth2
        .authenticate(url: '$uri', callbackUrlScheme: 'com.yeohaeng.ttukttak.app');

    print(response);

  }

  void revokeApple() async {

    final uri = Uri.https("appleid.apple.com", "/auth/authorize", {
      'client_id': 'com.yeohaeng-ttukttak.application.sign-in',
      'response_mode': 'form_post',
      'response_type': 'code',
      'redirect_uri':  'https://bug-steady-reliably.ngrok-free.app/api/v2/oauth2/apple',
      'scope': 'email name',
      'state': 'action=revoke'
    });

    final response = await FlutterWebAuth2
        .authenticate(url: '$uri', callbackUrlScheme: 'com.yeohaeng.ttukttak.app');

    print(response);

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: () => signInApple(), child: Text('Apple 로그인')),
            TextButton(onPressed: () => revokeApple(), child: Text('Apple 탈퇴'))
          ],
        ),
      ),
    );
  }
}
