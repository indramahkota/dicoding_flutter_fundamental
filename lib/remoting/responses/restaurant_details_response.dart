import 'package:dicoding_flutter_fundamental/remoting/responses/restaurant_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'restaurant_details_response.g.dart';

@JsonSerializable()
class RestaurantDetailsResponse extends BaseResponse {
  @JsonKey(name: "restaurant")
  final RestaurantResponse? restaurant;

  RestaurantDetailsResponse({
    super.error,
    super.message,
    this.restaurant,
  });

  factory RestaurantDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailsResponseFromJson(json);
}
