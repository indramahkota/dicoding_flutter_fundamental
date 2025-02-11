part of 'restaurant_bloc.dart';

class RestaurantStateData extends Equatable {
  final Restaurant restaurant;
  final String? error;

  const RestaurantStateData({
    this.restaurant = const Restaurant(),
    this.error,
  });

  @override
  List<Object?> get props => [restaurant, error];

  RestaurantStateData copyWith({
    Restaurant? data,
    String? error,
  }) {
    return RestaurantStateData(
      restaurant: data ?? restaurant,
      error: error ?? this.error,
    );
  }
}

sealed class RestaurantState {
  final RestaurantStateData data;

  const RestaurantState(this.data);
}

final class RestaurantInitialState extends RestaurantState {
  const RestaurantInitialState() : super(const RestaurantStateData());
}

final class RestaurantLoadingState extends RestaurantState {
  const RestaurantLoadingState(super.data);
}

final class RestaurantSuccessState extends RestaurantState {
  const RestaurantSuccessState(super.data);
}

final class RestaurantFailedState extends RestaurantState {
  const RestaurantFailedState(super.data);
}
