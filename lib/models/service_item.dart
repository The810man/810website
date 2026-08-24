import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_item.freezed.dart';

@freezed
class ServiceItem with _$ServiceItem {
  const factory ServiceItem({
    required String id,
    required String title,
    required String description,
    required List<String> items,
  }) = _ServiceItem;
}
