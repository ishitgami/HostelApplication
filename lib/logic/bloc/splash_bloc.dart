import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(super.initialState);

  @override
  SplashState get initialState => SplashInitial();

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SetSplash) {
      yield SplashLoading();
      //todo: add some actions like checking the connection etc.
      //I simulate the process with future delayed for 3 second
      await Future.delayed(Duration(seconds: 3));
      yield SplashLoaded();
    }
  }
}