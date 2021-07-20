import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import './../../services/services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;

  HomeBloc(HomeService homeService)
      : _homeService = homeService,
        super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadSplash) yield* _mapHomeShowSplash(event);
    if (event is HomeLoadPage) yield* _mapHomeShowPage(event);
  }

  Stream<HomeState> _mapHomeShowSplash(event) async* {
    yield HomeSplash();

    await Future.delayed(Duration(seconds: 5));

    yield HomePage();
  }

  Stream<HomeState> _mapHomeShowPage(event) async* {
    yield HomePage();
  }
}
