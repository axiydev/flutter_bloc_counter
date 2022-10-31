import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0;

  CounterBloc() : super(InitialConterState()) {
    on<CounterEvent>(mapEventToState);
  }

  void mapEventToState(event, emit) {
    if (event is OnIncrementPressedEvent) {
      emit(CounterSuccessState(count: ++count, message: 'Increment $count'));
    }
    if (event is OnDecrementPressedEvent) {
      emit(CounterSuccessState(count: --count, message: 'Decrement $count'));
      // emit(InitialConterState());
      // emit(CounterErrorState(error: 'error'));
    }
  }

  @override
  void onChange(Change<CounterState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }

  @override
  void onEvent(CounterEvent event) {
    debugPrint(event.toString());
    super.onEvent(event);
  }
}
