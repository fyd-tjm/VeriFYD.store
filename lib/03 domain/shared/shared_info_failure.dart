import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_info_failure.freezed.dart';

@freezed
@immutable
abstract class SharedInfoFailure with _$SharedInfoFailure {
  const factory SharedInfoFailure.permissionDenied() = PermissionDenied;
  const factory SharedInfoFailure.unexpected() = Unexpected;
}
