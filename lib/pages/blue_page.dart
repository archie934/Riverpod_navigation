import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_navigation/router/router_delegate.dart';
import 'package:simple_navigation/router/ui_pages.dart';
import 'package:simple_navigation/utilities/number_provider.dart';

class BluePage extends HookConsumerWidget {
  const BluePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final counter = ref.watch(numberProvider);
      final router = ref.watch(routerProvider);
      return Material(
        child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Text(counter.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){
                      router.push(redPageConfig);
                    }, child: Text("Go to red page", style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            )
        ),
      );
    },);
  }
}
