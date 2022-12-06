import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failure.freezed.dart';

@freezed
@immutable
abstract class UserFailure with _$UserFailure {
  //! FirebaseException codes
  // "aborted"
  const factory UserFailure.aborted() = _Aborted;
  // "invalid-argument"
  const factory UserFailure.invalidArgument() = _InvalidArgument;
  // "already-exists"
  const factory UserFailure.alreadyExists() = _AlreadyExists;
  // "not-found"
  const factory UserFailure.notFound() = _NotFound;
  // "permission-denied"
  const factory UserFailure.permissionDenied() = _PermissionDenied;
  // else
  const factory UserFailure.serverError() = _ServerError;
  // not FirebaseException
  const factory UserFailure.unknownError() = _UnknownError;
}
