import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/domain/store/product.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
@immutable
abstract class Store with _$Store {
  const factory Store({
    required String sId,
    required String name,
    required List<String> categories,
    required Map<String, int> types,
    required Map<String, String> socialPresence,
    required double rating,
    required String about,
    required List<String> storeImages,
    required String storeLogo,
    required Map<String, String> storeAddress,
    required Map<String, String> storeContact,
    // required Map<String, List<Product>> products,
    required String productsRef,
    required bool isLive,
    required String docId,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
