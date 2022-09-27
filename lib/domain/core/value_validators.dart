import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/core/failures.dart';

Either<ValueFailure<String>, String> validatePhoneNumber(String phone) {
  if (phone.length == 10) {
    return right(phone);
  } else {
    return left(ValueFailure.invalidPhoneLength(failedValue: phone));
  }
}

Either<ValueFailure<String>, String> validateOtp(String otp) {
  if (otp.length == 6) {
    return right(otp);
  } else {
    return left(ValueFailure.invalidPhoneLength(failedValue: otp));
  }
}

Either<ValueFailure<String>, String> validateUserName(String userName) {
  if (userName.isNotEmpty && userName.length < 15) {
    return right(userName);
  } else {
    return left(ValueFailure.invalidUserName(failedValue: userName));
  }
}
