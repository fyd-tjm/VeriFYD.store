part of 'shared_info_cubit.dart';

@freezed
class SharedInfoState with _$SharedInfoState {
  const SharedInfoState._();
  const factory SharedInfoState({
    required bool isFetching,
    required SharedInfo? sharedInfo,
    required Option<SharedInfoFailure> failure,
  }) = _SharedInfoState;
  factory SharedInfoState.initial() =>
      SharedInfoState(isFetching: true, sharedInfo: null, failure: none());
}
