// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchModel _$$_MatchModelFromJson(Map<String, dynamic> json) =>
    _$_MatchModel(
      id: json['id'] as int?,
      boutsheet_id: json['boutsheet_id'] as int?,
      bracket_opponent_id: json['bracket_opponent_id'] as int?,
      bracket_condition_id: json['bracket_condition_id'] as int?,
      bout_type: json['bout_type'] as String?,
      red_fighter: json['red_fighter'] == null
          ? null
          : FighterModel.fromJson(json['red_fighter'] as Map<String, dynamic>),
      blue_fighter: json['blue_fighter'] == null
          ? null
          : FighterModel.fromJson(json['blue_fighter'] as Map<String, dynamic>),
      red_fighter_status: json['red_fighter_status'] as String?,
      bout_order: json['bout_order'] as int?,
      blue_fighter_status: json['blue_fighter_status'] as String?,
      age: json['age'] as int?,
      weight: json['weight'] as int?,
      mins_length: json['mins_length'] as String?,
      status: json['status'] as int?,
      deleted_at: json['deleted_at'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      winner: json['winner'] as Map<String, dynamic>?,
      outcome: json['outcome'] as String?,
      high_score: json['high_score'] as String?,
      low_score: json['low_score'] as String?,
      comments: json['comments'] as String?,
      deny_reason: json['deny_reason'] as String?,
    );

Map<String, dynamic> _$$_MatchModelToJson(_$_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boutsheet_id': instance.boutsheet_id,
      'bracket_opponent_id': instance.bracket_opponent_id,
      'bracket_condition_id': instance.bracket_condition_id,
      'bout_type': instance.bout_type,
      'red_fighter': instance.red_fighter,
      'blue_fighter': instance.blue_fighter,
      'red_fighter_status': instance.red_fighter_status,
      'bout_order': instance.bout_order,
      'blue_fighter_status': instance.blue_fighter_status,
      'age': instance.age,
      'weight': instance.weight,
      'mins_length': instance.mins_length,
      'status': instance.status,
      'deleted_at': instance.deleted_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'winner': instance.winner,
      'outcome': instance.outcome,
      'high_score': instance.high_score,
      'low_score': instance.low_score,
      'comments': instance.comments,
      'deny_reason': instance.deny_reason,
    };
