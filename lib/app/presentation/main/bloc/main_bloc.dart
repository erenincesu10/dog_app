import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(MainState(
          selectedIndex: 0,
        )) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SelectIndexEvent>(_setSelectedIndex);
  }

  void _setSelectedIndex(SelectIndexEvent event, Emitter<MainState> emit) {
    emit(
      state.copyWith(selectedIndex: event.selectedIndex),
    );
  }
}
