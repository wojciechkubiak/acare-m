part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadSplash extends HomeEvent {}

class HomeLoadPage extends HomeEvent {}
