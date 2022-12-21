import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_info_failure.freezed.dart';

@freezed
@immutable
abstract class SharedInfoFailure with _$SharedInfoFailure {
  // 'permission-denied'
  const factory SharedInfoFailure.permissionDenied() = PermissionDenied;
  // 'not-found'
  const factory SharedInfoFailure.notFound() = NotFound;
  //  other firebase Firestore error
  const factory SharedInfoFailure.serverError() = ServerError;
  //  unknown/unexpected error
  const factory SharedInfoFailure.unexpectedError() = UnexpectedError;
}
