
import 'package:flutter/material.dart';
import 'router_delegate.dart';

class CustomBackButtonDispatcher extends RootBackButtonDispatcher {
  final CustomRouterDelegate _routerDelegate;

  CustomBackButtonDispatcher(this._routerDelegate)
      : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
