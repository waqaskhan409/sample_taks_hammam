import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_samplee/modules/test_sample/model/fighter_model.dart';

class AllFighters extends ConsumerWidget {
  FutureProvider fighterProvider;
  AllFighters({Key? key, required this.fighterProvider}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final allFighters = ref.watch(fighterProvider);
    // ref.read(matchProvider.notifier).getFighters();
    return allFighters.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error: $err'),
      data: (results) {
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final message = results[index] as FighterModel;
            return Column(
              children: [
                ListTile(
                  title: Text(message.firstName.toString()),
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
}
