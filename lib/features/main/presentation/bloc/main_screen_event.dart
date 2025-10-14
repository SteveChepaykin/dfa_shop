part of 'main_screen_bloc.dart';

abstract class MainScreenEvent {}

class InitializeMainScreenEvent extends MainScreenEvent {}

class LoadMainScreenEvent extends MainScreenEvent {}

class ErrorMainScreenEvent extends MainScreenEvent {
  ErrorMainScreenEvent({required this.message});

  final String message;
}
