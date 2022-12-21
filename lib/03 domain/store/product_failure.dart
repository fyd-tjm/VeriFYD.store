import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_failure.freezed.dart';

@freezed
@immutable
abstract class ProductFailure with _$ProductFailure {
  const factory ProductFailure.permissionDenied() = PermissionDenied;
  const factory ProductFailure.notFound() = NotFound;
  const factory ProductFailure.serverError() = ServerError;
  const factory ProductFailure.unexpectedError() = UnexpectedError;
}
