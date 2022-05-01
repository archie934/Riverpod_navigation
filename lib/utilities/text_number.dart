import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_navigation/utilities/number_provider.dart';

class TextNumber extends StatelessWidget {
  const TextNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final counter = ref.watch(numberProvider);
      return Text(counter.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),);
    },);
  }
}
