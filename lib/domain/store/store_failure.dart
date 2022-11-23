import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_failure.freezed.dart';

@freezed
@immutable
abstract class StoreFailure with _$StoreFailure {
  const factory StoreFailure.permissionDenied() = PermissionDenied;
  const factory StoreFailure.notExistAnymore() = NotExistAnymore;
  const factory StoreFailure.serverError() = ServerError;
  const factory StoreFailure.UnexpectedError() = UnexpectedError;
}
