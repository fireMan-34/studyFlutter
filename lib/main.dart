import 'package:my_app/app/index.dart';
// import './utils/index.dart';

enum AppClass {
  zero,
  first,
  second,
  thrid,
}

// 主入口
void main() {
  AppClass runClassInt = AppClass.thrid;
  switch (runClassInt) {
    case AppClass.thrid:
      runThirdApp();
      break;
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
