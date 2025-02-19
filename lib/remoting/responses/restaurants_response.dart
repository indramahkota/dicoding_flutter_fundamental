import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
import 'restaurant_response.dart';

part 'restaurants_response.g.dart';

@JsonSerializable()
class RestaurantsResponse extends BaseResponse {
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'restaurants')
  final List<RestaurantResponse>? restaurants;

  RestaurantsResponse({
    super.error,
    super.message,
    this.count,
    this.restaurants,
  });

  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsResponseFromJson(json);
}
