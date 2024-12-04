import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_provider.g.dart';

@Riverpod(keepAlive: true)
Future<MemberModel> member(MemberRef ref, String id) async {
  final response = await ref
      .watch(httpServiceProvider)
      .request('GET', '/api/v2/members/$id'); 

  return MemberModel.fromJson(response['member']);
}
