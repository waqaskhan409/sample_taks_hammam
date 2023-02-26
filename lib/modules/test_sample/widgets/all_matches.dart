import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_samplee/modules/test_sample/notifiers/match_provider.dart';

import '../model/match_model.dart';
import 'alert_dialogue.dart';

class AllMatches extends ConsumerWidget {
  StreamProvider matchProvider;

  MatchNotifiers matchNotifiers;
  AllMatches(
      {Key? key, required this.matchProvider, required this.matchNotifiers})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final allMatches = ref.watch(matchProvider);
    // ref.read(matchProvider.notifier);

    return allMatches.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error: $err'),
      data: (results) {
        results = results as List<MatchModel>;
        return ListView.builder(
          // reverse: true,
          itemCount: results.length,
          itemBuilder: (context, index) {
            final message = results[index] as MatchModel;
            return Column(
              children: [
                ListTile(
                  title: Text(message.red_fighter!.firstName.toString() +
                      " VS " +
                      message.blue_fighter!.firstName.toString()),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await onDeleteMatchCall(context, message, ref);
                      ref.listen(matchProvider, (previous, next) {});
                    },
                  ),
                ),
                const Divider(
                  height: 0.2,
                )
              ],
            );
          },
        );
      },
    );
  }

  Future<void> onDeleteMatchCall(
      BuildContext context, MatchModel message, WidgetRef ref) async {
    await showAlertDialog(
      onYes: () async {
        String message1 =
            await matchNotifiers.deleteMatch(message.id.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message1),
          backgroundColor:
              message1.contains("failed") ? Colors.red : Colors.green,
        ));
        ref.refresh(matchProvider);
      },
      context: context,
    );
  }
}
