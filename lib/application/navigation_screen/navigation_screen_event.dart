part of 'navigation_screen_bloc.dart';

@freezed
class NavigationScreenEvent with _$NavigationScreenEvent {
  const factory NavigationScreenEvent.onPageChanged({
    required int newPage,
  }) = OnPageChanged;

  const factory NavigationScreenEvent.initialPage() = InitialPage;
}
