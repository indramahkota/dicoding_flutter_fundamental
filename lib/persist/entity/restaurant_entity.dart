import 'package:json_annotation/json_annotation.dart';

part 'restaurant_entity.g.dart';

@JsonSerializable()
class RestaurantEntity {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "pictureId")
  final String? pictureId;
  @JsonKey(name: "rating")
  final double? rating;

  RestaurantEntity({
    this.id,
    this.name,
    this.city,
    this.pictureId,
    this.rating,
  });

  factory RestaurantEntity.fromJson(Map<String, dynamic> json) =>
      _$RestaurantEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantEntityToJson(this);
}
