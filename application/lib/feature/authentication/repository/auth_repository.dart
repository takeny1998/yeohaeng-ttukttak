import 'dart:async';

import 'package:application_new/feature/authentication/model/auth_model.dart';

abstract interface class AuthRepository {

  FutureOr<AuthModel?> find();

  FutureOr<void> save(AuthModel model);

  FutureOr<void> delete();

}