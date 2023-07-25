import 'package:my_app/app/index.dart';
// import './utils/index.dart';


// 主入口
void main() {
  int runClassInt = 1;
  switch (runClassInt) {
    case 1:
      runFirstApp();
    case 0:
    default:
      runDefaultApp();
    break;
  }
}
