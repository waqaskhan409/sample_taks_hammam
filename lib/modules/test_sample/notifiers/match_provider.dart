import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:test_samplee/modules/test_sample/model/fighter_model.dart';
import 'package:test_samplee/modules/test_sample/model/match_model.dart';
import 'package:test_samplee/modules/test_sample/repositories/match_repository.dart';

class MatchNotifiers {
  final MatchRepository matchRepository;
  List<MatchModel> _allMatches = [];
  List<FighterModel> _allFighters = [];

  MatchNotifiers(this.matchRepository);
  List<MatchModel> get allMatches => _allMatches;
  List<FighterModel> get allFighters => _allFighters;

  Stream<List<MatchModel>> getMatches() async* {
    final result = await matchRepository.getMatches();
    yield* result.fold((left) async* {
      throw Exception(left.message);
    }, (right) async* {
      _allMatches = right;
      yield _allMatches;
    });
  }

  Future<List<FighterModel>> getFighters() async {
    final result = await matchRepository.getFighters();
    return result.fold((left) async {
      throw Exception(left.message);
    }, (right) async {
      _allFighters = right;
      return _allFighters;
    });
  }

  Future<String> deleteMatch(String id) async {
    final result = await matchRepository.deleteMatch(id);
    return result.fold((left) async {
      return "Delete failed";
    }, (right) async {
      for (int i = 0; i < _allMatches.length; i++) {
        if (id == _allMatches[i].id.toString()) {
          _allMatches.removeAt(i);
        }
      }
      return "Delete Success";
    });
  }
}
