import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failure.freezed.dart';

@freezed
@immutable
abstract class UserFailure with _$UserFailure {
  //! FirebaseException codes
  // "aborted"
  const factory UserFailure.aborted() = Aborted;
  // "invalid-argument"
  const factory UserFailure.invalidArgument() = InvalidArgument;
  // "already-exists"
  const factory UserFailure.alreadyExists() = AlreadyExists;
  // "not-found"
  const factory UserFailure.notFound() = NotFound;
  // "permission-denied"
  const factory UserFailure.permissionDenied() = PermissionDenied;
  // else
  const factory UserFailure.serverError() = ServerError;
  // not FirebaseException
  const factory UserFailure.unknownError() = UnknownError;
}
