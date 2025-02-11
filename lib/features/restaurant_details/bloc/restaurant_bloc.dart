import 'package:bloc/bloc.dart';
import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/core/domain/restaurant.dart';
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_event.dart';

part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository repository;
  var stateData = const RestaurantStateData();

  RestaurantBloc({
    required this.repository,
  }) : super(const RestaurantInitialState()) {
    on<RestaurantInitEvent>(_onInit);
    on<RestaurantShowEvent>(_getDetailRestaurant);
  }

  void _onInit(
    RestaurantInitEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const RestaurantInitialState());
  }

  void _getDetailRestaurant(
    RestaurantShowEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(RestaurantLoadingState(stateData));

    var result = await repository.getDetailRestaurant(id: event.id);

    switch (result) {
      case Success<Restaurant>():
        stateData = stateData.copyWith(data: result.data, error: null);
        emit(RestaurantSuccessState(stateData));
      case Error<Restaurant>():
        emit(RestaurantFailedState(stateData.copyWith(error: result.message)));
    }
  }
}
