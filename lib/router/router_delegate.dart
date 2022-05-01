
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_navigation/pages/blue_page.dart';
import 'package:simple_navigation/pages/green_page.dart';
import 'package:simple_navigation/pages/red_page.dart';
import 'package:simple_navigation/utilities/app_state.dart';
import 'ui_pages.dart';

final routerProvider = Provider<CustomRouterDelegate>((ref) => CustomRouterDelegate(ref.read));

class CustomRouterDelegate extends RouterDelegate<PageConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {

  CustomRouterDelegate(this._reader) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  final List<Page> _pages = [];
  List<MaterialPage> get pages => List.unmodifiable(_pages);
  int numPages() => _pages.length;

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final Reader _reader;
  AppState get appState => _reader(navState);


  @override
  PageConfiguration get currentConfiguration => _pages.last.arguments as PageConfiguration;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: pages,
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void _removePage(Page page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        maintainState: false,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig, {bool isSilent = false}) {
    _pages.add(
      _createPage(child, pageConfig),
    );
    if(!isSilent){
      notifyListeners();
    }
  }

  void addPage(PageConfiguration pageConfig, {bool isSilent = false}) {
    final shouldAddPage = _pages.isEmpty || (_pages.last.arguments as PageConfiguration).uiPage != pageConfig.uiPage;
    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.Red:
          _addPageData(const RedPage(), redPageConfig, isSilent: isSilent);
          break;
        case Pages.Blue:
          _addPageData(const BluePage(), bluePageConfig, isSilent: isSilent);
          break;
        case Pages.Green:
          _addPageData(const GreenPage(), greenPageConfig, isSilent: isSilent);
          break;
        default:
          break;
      }
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  void addAll(List<PageConfiguration> routes) {
    _pages.clear();
    routes.forEach((route) {
      addPage(route);
    });
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty && (_pages.last.arguments as PageConfiguration).uiPage != configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration, isSilent: true);
    }
    return SynchronousFuture(null);
  }


}
