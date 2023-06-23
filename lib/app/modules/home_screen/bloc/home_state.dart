part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int tabIndex;

  const HomeState({
    required this.tabIndex,
  });
}

class HomeInitial extends HomeState {
  const HomeInitial({required super.tabIndex});
}
