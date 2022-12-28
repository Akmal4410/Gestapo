import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_screen_event.dart';
part 'navigation_screen_state.dart';
part 'navigation_screen_bloc.freezed.dart';

class NavigationScreenBloc
    extends Bloc<NavigationScreenEvent, NavigationScreenState> {
  NavigationScreenBloc() : super(NavigationScreenState.initial()) {
    on<OnPageChanged>((event, emit) {
      emit(NavigationScreenState(
        page: event.newPage,
      ));
    });
    on<InitialPage>((event, emit) {
      emit(NavigationScreenState(
        page: 0,
      ));
    });
  }
}
