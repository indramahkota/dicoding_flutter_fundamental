part of 'restaurant_bloc.dart';

sealed class RestaurantEvent {
  const RestaurantEvent();
}

final class RestaurantInitEvent extends RestaurantEvent {}

final class RestaurantShowEvent extends RestaurantEvent {
  final String? id;

  const RestaurantShowEvent({this.id});
}
