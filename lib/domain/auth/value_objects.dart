import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/core/failures.dart';
import 'package:verifyd_store/domain/core/value_object.dart';
import 'package:verifyd_store/domain/core/value_validators.dart';

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PhoneNumber._(this.value);

  factory PhoneNumber(String input) {
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }
  factory PhoneNumber.fromDb(String phoneNumber) {
    phoneNumber = phoneNumber.trim().substring(
          3,
        );
    return PhoneNumber._(
      right(phoneNumber),
    );
  }
}

class Otp extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Otp._(this.value);

  factory Otp(String input) {
    return Otp._(
      validateOtp(input),
    );
  }
}

//! UserName
class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const UserName._(this.value);

  factory UserName(String input) {
    return UserName._(validateUserName(input));
  }
  factory UserName.fromDb(String userName) {
    userName = userName.trim();
    return UserName._(
      right(userName),
    );
  }
}
