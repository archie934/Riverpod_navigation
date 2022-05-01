import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_navigation/utilities/number_provider.dart';
import 'package:simple_navigation/utilities/text_number.dart';

class RedPage extends HookConsumerWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    return Material(child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: [
              TextNumber(),
              TextButton(onPressed: (){
                final setCounter = ref.read(numberProvider.notifier);
                setCounter.increment();
              }, child: Text("Increment"))
            ],
          ),
        )
    ),);
  }
}
