
import 'dart:async';

import '../../data/model/auth_model.dart';

abstract interface class AuthRepository {

  FutureOr<AuthModel?> find();

  FutureOr<void> save(AuthModel model);

  FutureOr<void> delete();

}