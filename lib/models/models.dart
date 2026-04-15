import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String title,
    required String description,
    required List<String> items,
  }) = _Service;
}

@freezed
class Platform with _$Platform {
  const factory Platform({
    required String name,
    required String iconName,
    required String url,
    required String description,
    required String tag,
  }) = _Platform;
}
