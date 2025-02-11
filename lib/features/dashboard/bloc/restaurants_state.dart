part of 'restaurants_bloc.dart';

class RestaurantsStateData extends Equatable {
  final List<Restaurant> restaurants;
  final String? error;

  const RestaurantsStateData({
    this.restaurants = const [],
    this.error,
  });

  @override
  List<Object?> get props => [restaurants, error];

  RestaurantsStateData copyWith({
    List<Restaurant>? data,
    String? error,
  }) {
    return RestaurantsStateData(
      restaurants: data ?? restaurants,
      error: error ?? this.error,
    );
  }
}

sealed class RestaurantsState {
  final RestaurantsStateData data;

  const RestaurantsState(this.data);
}

final class RestaurantsInitialState extends RestaurantsState {
  const RestaurantsInitialState() : super(const RestaurantsStateData());
}

final class RestaurantsLoadingState extends RestaurantsState {
  const RestaurantsLoadingState(super.data);
}

final class RestaurantsSuccessState extends RestaurantsState {
  const RestaurantsSuccessState(super.data);
}

final class RestaurantsFailedState extends RestaurantsState {
  const RestaurantsFailedState(super.data);
}
