part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

@immutable
class HomeEventGetCategory implements HomeEvent {
  const HomeEventGetCategory();
}

@immutable
class HomeEventGetFood implements HomeEvent {
  final String category;

  const HomeEventGetFood(this.category);
}
