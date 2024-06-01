import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationBarNotifier extends Notifier<int> {
  @override
  build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

final navigationBarProvider =
    NotifierProvider<NavigationBarNotifier, int>(NavigationBarNotifier.new);
