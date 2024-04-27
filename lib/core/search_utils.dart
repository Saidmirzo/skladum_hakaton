import 'dart:async';
import 'dart:ui';

class SearchDelay {
  SearchDelay({this.milliseconds = 800});

  final int milliseconds;
  Timer? _timer;

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
