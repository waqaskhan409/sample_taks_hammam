import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_samplee/modules/test_sample/model/fighter_model.dart';
part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    int? id,
    int? boutsheet_id,
    int? bracket_opponent_id,
    int? bracket_condition_id,
    String? bout_type,
    FighterModel? red_fighter,
    FighterModel? blue_fighter,
    String? red_fighter_status,
    int? bout_order,
    String? blue_fighter_status,
    int? age,
    int? weight,
    String? mins_length,
    int? status,
    String? deleted_at,
    String? created_at,
    String? updated_at,
    Map<String, dynamic>? winner,
    String? outcome,
    String? high_score,
    String? low_score,
    String? comments,
    String? deny_reason,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
  // factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
  //       id: json["id"],
  //       boutsheet_id: json["boutsheet_id"],
  //       bracket_opponent_id: json["bracket_opponent_id"],
  //       bracket_condition_id: json["bracket_condition_id"],
  //       bout_type: json["bout_type"],
  //       red_fighter: FighterModel.fromJson(json["red_fighter"]),
  //       blue_fighter: FighterModel.fromJson(json["blue_fighter"]),
  //       red_fighter_status: json["red_fighter_status"],
  //       bout_order: json["bout_order"],
  //       blue_fighter_status: json["blue_fighter_status"],
  //       age: json["age"],
  //       weight: json["weight"],
  //       mins_length: json["mins_length"],
  //       status: json["status"],
  //       deleted_at: json["deleted_at"],
  //       updated_at: json["updated_at"],
  //       created_at: json["created_at"],
  //       winner: json["winner"].toString(),
  //       outcome: json["outcome"],
  //       high_score: json["high_score"],
  //       low_score: json["low_score"],
  //       comments: json["comments"],
  //       deny_reason: json["deny_reason"],
  //     );
}
