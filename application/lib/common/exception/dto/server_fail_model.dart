
sealed class ServerFailModel {
  final String code;
  final String message;

  ServerFailModel({required this.code, required this.message});

  factory ServerFailModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('field')) {
      return ServerFieldFailModel(
        code: json['code'] as String,
        message: json['message'] as String,
        field: json['field'] as String,
      );
    }

    return ServerSingleFailModel(
        code: json['code'] as String, message: json['message'] as String);
  }
}

final class ServerSingleFailModel extends ServerFailModel {
  ServerSingleFailModel({required super.code, required super.message});
}

final class ServerFieldFailModel extends ServerFailModel {
  final String field;

  ServerFieldFailModel(
      {required super.code, required super.message, required this.field});
}
