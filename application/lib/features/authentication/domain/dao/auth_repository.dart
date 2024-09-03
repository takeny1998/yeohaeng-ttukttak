
import 'dart:async';

import 'package:application/features/authentication/domain/entity/auth_entity.dart';

abstract interface class AuthRepository {

  FutureOr<AuthEntity?> find();

  FutureOr<void> save(AuthEntity model);

  FutureOr<void> delete();

}