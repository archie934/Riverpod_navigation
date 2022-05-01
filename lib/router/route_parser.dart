
import 'package:flutter/material.dart';
import 'ui_pages.dart';

class RouteParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return redPageConfig;
    }
    final path = '/' + uri.pathSegments[0];
    switch (path) {
      case redPath:
        return redPageConfig;
      case bluePath:
        return bluePageConfig;
      case greenPath:
        return greenPageConfig;
      default:
        return redPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.Red:
        return const RouteInformation(location: redPath);
      case Pages.Blue:
        return const RouteInformation(location: bluePath);
      case Pages.Green:
        return const RouteInformation(location: greenPath);
      default: return const RouteInformation(location: redPath);

    }
  }
}