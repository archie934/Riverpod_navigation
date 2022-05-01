
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = StateNotifierProvider<NumberProvider, int>((ref) => NumberProvider());

class NumberProvider extends StateNotifier<int>{

  NumberProvider() : super(0);

  void increment(){
    var asd = state + 1;
    state = asd;
  }

  int get getState => state;

}