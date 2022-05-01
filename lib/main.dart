import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_navigation/router/back_dispatcher.dart';
import 'package:simple_navigation/router/route_parser.dart';
import 'package:simple_navigation/router/router_delegate.dart';
import 'package:simple_navigation/router/ui_pages.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final parser = RouteParser();
  late CustomRouterDelegate delegate;
  late BackButtonDispatcher backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    delegate = ref.read(routerProvider);
    backButtonDispatcher = CustomBackButtonDispatcher(delegate);
    delegate.addPage(bluePageConfig);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: delegate,
      routeInformationParser: parser,
      backButtonDispatcher: backButtonDispatcher,
    );
  }

}
