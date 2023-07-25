import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void runFirstApp () {
  runApp(const MyFirstApp());
}

// 在构建每一个 Flutter 应用时，widget 都是一个基本要素 .
// 应用实例
class MyFirstApp  extends StatelessWidget {
  const MyFirstApp({super.key});

  // 每一个 widget 都会有一个 build 。每当 context 环境变换时，Flutter 会自动调用该对象。
  @override
  Widget build(BuildContext  context) {
    return ChangeNotifierProvider(
      // 建立通知实例
      create: (context) => MyFirstAppState(),
      child: MaterialApp(
        title: '我的第一个 Flutter 应用',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home:MyFirstHomePage(),
        ),
      );
  }
}

// 定义应用状态
// ChangeNotifier 管理应用状态
class MyFirstAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    // 变更值
    current = WordPair.random();
    // 推式观察者
    notifyListeners();
  }
}


class MyFirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 订阅应用实例
    var appState = context.watch<MyFirstAppState>();

    // 每个 build 方法都必须返回一个 widget 或（更常见的）嵌套 widget 树
    return Scaffold(
      body: Center(
        // Column 是 Flutter 中最基础的布局 widget 之一。它接受任意数量的子项并将这些子项从上到下放在一列中
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('一个随机的想法:'),
        Text(appState.current.asLowerCase),
        ElevatedButton(onPressed: () {
          appState.getNext();
        }, child: const Text('下一个')),

        ElevatedButton(onPressed: (){
            print('上一个按钮');
        }, child: const Text('上一个'))
      ])),
    );
  }
}