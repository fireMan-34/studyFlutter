import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void runSecondApp() {
  runApp(const SecondApp());
}

class SecondApp extends StatelessWidget {
  const SecondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SecondAppState(),
      child: MaterialApp(
        home: SecondHomePage(),
      ),
    );
  }
}

class SecondAppState extends ChangeNotifier {}

class SecondHomePage extends StatelessWidget {
  // 手势组件基础封装
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('点击触发');
      },
      child: const  Center(
        child: Text('测试文本'),
      ),
    );
  }
}
