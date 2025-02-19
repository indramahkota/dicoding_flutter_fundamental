// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantEntity _$RestaurantEntityFromJson(Map<String, dynamic> json) =>
    RestaurantEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      pictureId: json['pictureId'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RestaurantEntityToJson(RestaurantEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'pictureId': instance.pictureId,
      'rating': instance.rating,
    };
