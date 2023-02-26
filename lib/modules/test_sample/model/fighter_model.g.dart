// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fighter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FighterModel _$$_FighterModelFromJson(Map<String, dynamic> json) =>
    _$_FighterModel(
      id: json['id'] as int?,
      eventId: json['event_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      usaBoxingId: json['usa_boxing_id'] as String?,
      numberOfFights: json['number_of_fights'] as int?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      picture: json['picture'] as String?,
      gymName: json['gym_name'] as String?,
    );

Map<String, dynamic> _$$_FighterModelToJson(_$_FighterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.eventId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'usa_boxing_id': instance.usaBoxingId,
      'number_of_fights': instance.numberOfFights,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'picture': instance.picture,
      'gym_name': instance.gymName,
    };
