import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_failure.freezed.dart';

@freezed
@immutable
abstract class CartFailure with _$CartFailure {
  const factory CartFailure.notAvailableAnymore() = NotAvailableAnymore;
  const factory CartFailure.maxItemAvailability() = maxItemAvailability;
  const factory CartFailure.maxCartLimit() = maxItemLimit;
  const factory CartFailure.notFound() = NotFound;
  const factory CartFailure.permissionDenied() = PermissionDenied;
  const factory CartFailure.serverError() = ServerError;
  const factory CartFailure.unexpectedError() = UnexpectedError;
}
