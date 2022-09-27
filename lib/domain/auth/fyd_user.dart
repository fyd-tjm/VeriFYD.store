import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';
import 'package:verifyd_store/domain/core/value_object.dart';

part 'fyd_user.freezed.dart';

@freezed
@immutable
abstract class FydUser with _$FydUser {
  const factory FydUser({
    required UniqueId uId,
    required PhoneNumber userPhoneNumber,
    UserName? userName,
  }) = _FydUser;
}
