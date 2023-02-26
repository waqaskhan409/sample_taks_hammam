import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:test_samplee/modules/test_sample/model/fighter_model.dart';
import 'package:test_samplee/modules/test_sample/model/match_model.dart';
import 'package:test_samplee/modules/test_sample/notifiers/match_provider.dart';
import 'package:test_samplee/modules/test_sample/repositories/match_repository.dart';
import 'package:test_samplee/modules/test_sample/widgets/all_fighters.dart';
import 'package:test_samplee/modules/test_sample/widgets/all_matches.dart';

import '../widgets/alert_dialogue.dart';

class MatchScreen extends StatelessWidget {
  MatchScreen({Key? key}) : super(key: key);

  MatchNotifiers matchNotifiers = MatchNotifiers(MatchRepository(Client()));
  static List<Tab> tabs = <Tab>[
    const Tab(text: "Matches"),
    const Tab(text: "Fighters"),
  ];
  @override
  Widget build(BuildContext context) {
    StreamProvider matchProvider =
        StreamProvider<List<MatchModel>>((ref) async* {
      yield* matchNotifiers.getMatches();
    });
    FutureProvider fighterProvider =
        FutureProvider<List<FighterModel>>((ref) async {
      return await matchNotifiers.getFighters();
    });
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        final TabController? tabController = DefaultTabController.of(context);
        tabController?.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text("Match"),
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: [
              AllMatches(
                matchProvider: matchProvider,
                matchNotifiers: matchNotifiers,
              ),
              AllFighters(
                fighterProvider: fighterProvider,
              )
            ],
          ),
        );
      }),
    );
  }
}
