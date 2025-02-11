part of 'restaurants_bloc.dart';

sealed class RestaurantsEvent {
  const RestaurantsEvent();
}

final class RestaurantsInitEvent extends RestaurantsEvent {}

final class RestaurantsShowEvent extends RestaurantsEvent {
  final String? id;

  const RestaurantsShowEvent({this.id});
}
