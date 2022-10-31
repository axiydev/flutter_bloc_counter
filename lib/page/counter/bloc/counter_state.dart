part of 'counter_bloc.dart';

abstract class CounterState {
  CounterState();
}

class InitialConterState extends CounterState {
  InitialConterState();
}

class CounterSuccessState implements CounterState {
  int? count;
  String? message;
  CounterSuccessState({this.count = 0, this.message});
}

class CounterLoadingState implements CounterState {
  CounterLoadingState();
}

class CounterErrorState implements CounterState {
  Object error;
  CounterErrorState({required this.error});
}
