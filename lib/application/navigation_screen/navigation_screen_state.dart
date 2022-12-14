part of 'navigation_screen_bloc.dart';

@freezed
class NavigationScreenState with _$NavigationScreenState {
  const factory NavigationScreenState({
    required int page,
  }) = _NavigationScreenState;

  factory NavigationScreenState.initial() {
    return const NavigationScreenState(page: 0);
  }
}
