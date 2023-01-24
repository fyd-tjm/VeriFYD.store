import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart_failure.freezed.dart';

@freezed
@immutable
abstract class CartFailure with _$CartFailure {
  const factory CartFailure.itemNotAvailableAnymore() = ItemNotAvailableAnymore;
  const factory CartFailure.maxItemAvailability() = maxItemAvailability;
  const factory CartFailure.maxCartLimit() = maxCartLimit;
  const factory CartFailure.availabilityCheckFailure() =
      AvailabilityCheckFailure;
  const factory CartFailure.itemsDetailFailure() = ItemsDetailFailure;
  const factory CartFailure.updateCartFailure() = UpdateCartFailure;
  const factory CartFailure.cartStreamFailure() = CartStreamFailure;
  const factory CartFailure.unexpectedError(String? error) = UnexpectedError;
}
