

import 'package:simple_navigation/utilities/app_state.dart';


const String redPath = '/red';
const String bluePath = '/blue';
const String greenPath = '/green';

enum Pages {
  Red,
  Blue,
  Green,
}

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction? currentPageAction;

  PageConfiguration({required this.key, required this.path, required this.uiPage, this.currentPageAction});
}

PageConfiguration redPageConfig = PageConfiguration(key: 'Red', path: redPath, uiPage: Pages.Red);
PageConfiguration bluePageConfig = PageConfiguration(key: 'Blue', path: bluePath, uiPage: Pages.Blue);
PageConfiguration greenPageConfig = PageConfiguration(key: 'Green', path: greenPath, uiPage: Pages.Green);
