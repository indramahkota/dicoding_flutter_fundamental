import 'package:bloc/bloc.dart';
import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final RestaurantRepository repository;
  var stateData = const RestaurantsStateData();

  RestaurantsBloc({
    required this.repository,
  }) : super(const RestaurantsInitialState()) {
    on<RestaurantsInitEvent>(_onInit);
    on<RestaurantsShowEvent>(_getListRestaurant);
  }

  void _onInit(
    RestaurantsInitEvent event,
    Emitter<RestaurantsState> emit,
  ) async {
    debugPrint('onInit');
    emit(const RestaurantsInitialState());
  }

  void _getListRestaurant(
    RestaurantsShowEvent event,
    Emitter<RestaurantsState> emit,
  ) async {
    debugPrint('getListRestaurant');
    emit(RestaurantsLoadingState(stateData));

    var result = await repository.getListRestaurant();
    debugPrint('Result: ${result.data}');

    switch (result) {
      case Success<List<Restaurant>>():
        stateData = stateData.copyWith(data: result.data, error: null);
        emit(RestaurantsSuccessState(stateData));
      case Error<List<Restaurant>>():
        emit(RestaurantsFailedState(stateData.copyWith(error: result.message)));
    }
  }
}
