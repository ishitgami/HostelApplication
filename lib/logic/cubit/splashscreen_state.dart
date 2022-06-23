part of 'splashscreen_cubit.dart';

@immutable
abstract class SplashscreenState {}

class SplashscreenInitial extends SplashscreenState {}

class Loading extends SplashscreenState {}

class Loaded extends SplashscreenState {}