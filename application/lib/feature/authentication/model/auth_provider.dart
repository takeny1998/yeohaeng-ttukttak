import 'package:application_new/common/exception/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

sealed class AuthProvider {
  String getName();

  Future<String> authorize();
}

final class AppleProvider extends AuthProvider {
  @override
  Future<String> authorize() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
    ).catchError((error) => throw AuthorizationException());

    return credential.authorizationCode;
  }

  @override
  String getName() {
    return 'APPLE';
  }
}

final class GoogleProvider extends AuthProvider {
  @override
  Future<String> authorize() async {
    final credential = await GoogleSignIn(scopes: <String>[
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/user.gender.read',
      'https://www.googleapis.com/auth/user.birthday.read'
    ]).signIn().catchError((error) => throw AuthorizationException());

    final authorizationCode = credential?.serverAuthCode;

    if (authorizationCode == null) {
      throw AuthorizationException();
    }
    return authorizationCode;
  }

  @override
  String getName() {
    return 'GOOGLE';
  }
}
