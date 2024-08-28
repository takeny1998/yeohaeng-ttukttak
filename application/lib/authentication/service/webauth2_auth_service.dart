
import 'dart:convert';

import 'package:application/authentication/service/auth_service.dart';
import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class WebAuth2AuthService implements AuthService {

  @override
  Future<AuthCredentials> register() async {

    final uri = Uri.https("appleid.apple.com", "/auth/authorize", {
      'client_id': 'com.yeohaeng-ttukttak.application.sign-in',
      'response_mode': 'form_post',
      'response_type': 'code',
      'redirect_uri':  'https://bug-steady-reliably.ngrok-free.app/api/v2/oauth2/apple/register',
      'scope': 'email name',
    });

    final encodedResponse = await FlutterWebAuth2.authenticate(
        url: '$uri',
        callbackUrlScheme: 'com.yeohaeng-ttukttak.application');

    final responseString = Uri.decodeComponent(
        Uri.parse(encodedResponse).queryParameters['response']!);

    return AuthCredentials.fromJson(json.decode(responseString));

  }

  @override
  Future<void> revoke() async {

    final uri = Uri.https("appleid.apple.com", "/auth/authorize", {
      'client_id': 'com.yeohaeng-ttukttak.application.sign-in',
      'response_mode': 'form_post',
      'response_type': 'code',
      'redirect_uri':  'https://bug-steady-reliably.ngrok-free.app/api/v2/oauth2/apple/revoke',
      'scope': 'email name',
    });

    await FlutterWebAuth2.authenticate(
        url: '$uri',
        callbackUrlScheme: 'com.yeohaeng-ttukttak.application');

  }

}