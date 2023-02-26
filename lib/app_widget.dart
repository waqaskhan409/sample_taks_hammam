import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_samplee/providers/app_coordinator.dart';

import 'modules/test_sample/screens/match_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Matches and Fighters Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProviderScope(
          child: FutureBuilder(
              future: AppCoordinator.shared.init(context),
              builder: (context, snapshot) {
                return MatchScreen();
              }),
        ));
  }
}
