part of 'counter_bloc.dart';

abstract class CounterEvent {}

class OnIncrementPressedEvent extends CounterEvent {}

class OnDecrementPressedEvent extends CounterEvent {}
