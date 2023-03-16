part of 'network_cubit.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState({required bool isNetworkAvailable}) =
      _NetworkState;

  factory NetworkState.initial() =>
      const NetworkState(isNetworkAvailable: true);
}
