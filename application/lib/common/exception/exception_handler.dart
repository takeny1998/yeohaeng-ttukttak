import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/authentication/repository/auth_repository_provider.dart';
import 'package:application_new/main.dart';
import 'package:uuid/v4.dart';

import '../event/event.dart';
import '../log/logger.dart';
import '../session/session_provider.dart';
import 'business_exception.dart';
import 'network_exception.dart';
import 'server_exception.dart';

bool handleException(Object error, StackTrace? stack) {
  final uuid = const UuidV4().generate().substring(0, 6);

  logger.e('[$uuid][Error]', stackTrace: stack, error: error);

  if (error is NetworkException) {
    logger.e(
        '[$uuid][NetworkException] code = ${error.statusCode} message = ${error.statusMessage}');

    const code = 'network_error_occurred';

    final message =
        providerContainer.read(translationServiceProvider).from(code);

    providerContainer.read(sessionProvider.notifier).omitError(code, message);
    return true;
  }

  if (error is ServerException) {
    if (error is ServerErrorException) {
      logger.e(
          '[$uuid][ServerErrorException] code = ${error.code}, message = ${error.message}');

      providerContainer
          .read(sessionProvider.notifier)
          .omitError(error.code, error.message);

      return true;
    }

    if (error is ServerFailException) {
      logger.e('[$uuid][ServerFailException] errors = ${error.errors}');
      final List<String> messages = [];

      for (final error in error.errors) {
        if (error.code == 'AUTHORIZATION_ERROR') {
          invalidateAuthorization();
        }
        messages.add(error.message);
      }
      showErrorMessage(messages.join('\n'));

      return true;
    }
    return true;
  }

  if (error is BusinessException) {
    if (error is AuthorizationException) {
      invalidateAuthorization();
      return true;
    }

    if (error.message != null) {
      showErrorMessage(error.message!);
    }
    return true;
  }

  return false;
}

void invalidateAuthorization() {
  final sessionNotifier = providerContainer.read(sessionProvider.notifier);
  providerContainer.read(authRepositoryProvider).delete();
  sessionNotifier.updateLoginMember(null);
}

void showErrorMessage(String message) {
  eventController.add(MessageEvent(message));
}
