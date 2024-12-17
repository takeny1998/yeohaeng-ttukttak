import 'package:application_new/domain/member/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_model.dart';

part 'session_model.freezed.dart';

@freezed
class SessionModel with _$SessionModel {

  const factory SessionModel({
    MemberModel? member,
    ErrorModel? error,
  }) = _SessionModel;

}
