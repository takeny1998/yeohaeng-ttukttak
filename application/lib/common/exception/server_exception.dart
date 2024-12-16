
import 'dart:ui';

import 'package:application_new/common/exception/dto/server_fail_model.dart';

abstract class ServerException extends Error {}

final class ServerErrorException extends ServerException {

  final String code;
  final String message;

  ServerErrorException({required this.code, required this.message});

}

class ServerFailException extends ServerException {

  final List<ServerFailModel> errors;

  ServerFailException({required this.errors});

  void consumeFieldErrors(void Function(Map<String, String> fieldErrors) onConsume) {

    final Map<String, String> fieldErrors = {};

    final List<ServerFailModel> unhandledErrors = [];

    for (final error in errors) {
      switch (error) {
        case ServerSingleFailModel():
          unhandledErrors.add(error);
        case ServerFieldFailModel(:final field, :final message):
          fieldErrors[field] = message;
      }
    }

    onConsume.call(fieldErrors);

    if (unhandledErrors.isNotEmpty) {
      throw ServerFailException(errors: unhandledErrors);
    }

  }

}