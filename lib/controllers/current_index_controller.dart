import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentIndexController extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

final currentIndexController =
    NotifierProvider<CurrentIndexController, int>(() {
  return CurrentIndexController();
});
