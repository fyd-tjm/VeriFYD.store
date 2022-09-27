import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
@immutable
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidPhoneLength({
    required T failedValue,
  }) = InvalidPhoneLength<T>;
  const factory ValueFailure.invalidOtpLength({
    required T failedValue,
  }) = InvalidOtpLength<T>;
  const factory ValueFailure.invalidUserName({
    required T failedValue,
  }) = InvalidUserName<T>;
}
