import 'package:freezed_annotation/freezed_annotation.dart';
part 'fighter_model.freezed.dart';
part 'fighter_model.g.dart';

@freezed
class FighterModel with _$FighterModel {
  const factory FighterModel({
    int? id,
    @JsonKey(name: "event_id") int? eventId,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "usa_boxing_id") String? usaBoxingId,
    @JsonKey(name: "number_of_fights") int? numberOfFights,
    String? gender,
    @JsonKey(name: "date_of_birth") String? dateOfBirth,
    String? picture,
    @JsonKey(name: "gym_name") String? gymName,
  }) = _FighterModel;

  factory FighterModel.fromJson(Map<String, dynamic> json) =>
      _$FighterModelFromJson(json);
}
