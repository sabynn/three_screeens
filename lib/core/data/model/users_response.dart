import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:three_screeens/core/data/model/user.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UsersResponse({
    required int page,
    required int perPage,
    required int total,
    required int totalPages,
    required List<User> data,
  }) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, Object?> json) =>
      _$UsersResponseFromJson(json);
}



