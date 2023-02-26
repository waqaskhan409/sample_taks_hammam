import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:test_samplee/modules/test_sample/model/fighter_model.dart';
import 'package:test_samplee/modules/test_sample/model/match_model.dart';

import '../../../utils/app_urls.dart';
import '../../../utils/failures.dart';

class MatchRepository {
  final Client client;

  MatchRepository(this.client);
  Future<Either<Failure, List<MatchModel>>> getMatches() async {
    final url = Uri.parse(
      AppUrl.baseUrl + AppUrl.getMatches,
    );
    try {
      final response = await get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + AppUrl.appToken
        },
      ).timeout(Duration(seconds: 5)).then((value) => value);

      if (response.statusCode == 200) {
        final jsonMatches =
            (json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>);

        List<MatchModel> list = [];
        jsonMatches.forEach((element) {
          list.add(MatchModel.fromJson(element));
        });

        return Right(list);
      }
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }

    return Left(UnRecognizedFailure());
  }

  Future<Either<Failure, List<FighterModel>>> getFighters() async {
    final url = Uri.parse(AppUrl.baseUrl + AppUrl.getFighters);
    try {
      final response = await get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token ' + AppUrl.appToken
        },
      ).timeout(Duration(seconds: 5)).then((value) => value);

      if (response.statusCode == 200) {
        final jsonFighters =
            (json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>);
        List<FighterModel> list = [];
        jsonFighters.forEach((element) {
          list.add(FighterModel.fromJson(element));
        });

        return Right(list);
      }
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }

    return Left(UnRecognizedFailure());
  }

  Future<Either<Failure, String>> deleteMatch(String id) async {
    final url = Uri.parse(AppUrl.baseUrl + AppUrl.delete_match(id));
    try {
      final response = await delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + AppUrl.appToken
        },
      ).timeout(const Duration(seconds: 5)).then((value) => value);
      if (response.statusCode == 204) {
        return const Right("success");
      }
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }

    return Left(UnRecognizedFailure());
  }
}
