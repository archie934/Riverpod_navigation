
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_navigation/router/ui_pages.dart';


final navState = ChangeNotifierProvider<AppState>((ref) => AppState());

enum ActionType {
  none,
  addPage,
  addAll,
  addWidget,
  pop,
  replace,
  replaceAll
}

class PageAction {
  ActionType state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction({this.state = ActionType.none, this.page, this.pages, this.widget});
}

class AppState extends ChangeNotifier {
  final bool _loggedIn = false;
  bool get loggedIn  => _loggedIn;
  bool _splashFinished = false;
  bool get splashFinished => _splashFinished;
  PageAction _currentAction = PageAction();
  PageAction get currentAction => _currentAction;
  set currentAction(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }


  void resetCurrentAction() {
    _currentAction = PageAction();
  }

  void setSplashFinished() {
    _splashFinished = true;
    if (_loggedIn) {
      //_currentAction = PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
    } else {
      _currentAction = PageAction(state: ActionType.replaceAll, page: bluePageConfig);
    }
    notifyListeners();
  }

  // void login() {
  //   _loggedIn = true;
  //   saveLoginState(loggedIn);
  //   _currentAction = PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
  //   notifyListeners();
  // }
  //
  // void logout() {
  //   _loggedIn = false;
  //   saveLoginState(loggedIn);
  //   _currentAction = PageAction(state: PageState.replaceAll, page: LoginPageConfig);
  //   notifyListeners();
  // }

  // void saveLoginState(bool loggedIn) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(LoggedInKey, loggedIn);
  // }
  //
  // void getLoggedInState() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _loggedIn = prefs.getBool(LoggedInKey);
  //   if (_loggedIn == null) {
  //     _loggedIn = false;
  //   }
  // }
}