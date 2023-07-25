import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void runFirstApp () {
  runApp(const MyFirstApp());
}

class MyFirstApp  extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext  context) {
    return ChangeNotifierProvider(
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


class MyFirstAppState extends ChangeNotifier {
  var current = WordPair.random();
}


class MyFirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyFirstAppState>();

    return Scaffold(
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('一个随机的想法:'),
        Text(appState.current.asLowerCase),
        ElevatedButton(onPressed: () {
          print('下一个按钮');
        }, child: const Text('下一个')),

        ElevatedButton(onPressed: (){
            print('上一个按钮');
        }, child: const Text('上一个'))
      ])),
    );
  }
}