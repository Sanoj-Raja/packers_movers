part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class TabChangeEvent extends HomeEvent {
  final int tabIndex;

  TabChangeEvent({required this.tabIndex});
}
