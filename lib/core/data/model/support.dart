import 'package:freezed_annotation/freezed_annotation.dart';

part 'support.freezed.dart';
part 'support.g.dart';

@freezed
class Support with _$Support {
  const factory Support({
    required String url,
    required String text,
  }) = _Support;

  factory Support.fromJson(Map<String, Object?> json) =>
      _$SupportFromJson(json);
}
