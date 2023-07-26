import 'package:my_app/app/index.dart';
// import './utils/index.dart';

enum AppClass {
  zero,
  first,
  second,
}

// 主入口
void main() {
  AppClass runClassInt = AppClass.second;
  switch (runClassInt) {
    case AppClass.second:
      runSecondApp();
      break;
    case AppClass.first:
      runFirstApp();
      break;
    case AppClass.zero:
    default:
      runDefaultApp();
      break;
  }
}
