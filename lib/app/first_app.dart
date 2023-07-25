import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void runFirstApp() {
  runApp(const MyFirstApp());
}

// 在构建每一个 Flutter 应用时，widget 都是一个基本要素 .
// 应用实例
class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  // 每一个 widget 都会有一个 build 。每当 context 环境变换时，Flutter 会自动调用该对象。
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 建立通知实例
      create: (context) => MyFirstAppState(),
      child: MaterialApp(
        title: '我的第一个 Flutter 应用',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: MyFirstHomePage1(),
      ),
    );
  }
}

// 定义应用状态
// ChangeNotifier 管理应用状态
class MyFirstAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];
  var selectedIndexInAnotherWidget = 0;
  var indexInYetAnotherWidget = 42;
  var optionASelected = false;
  var optionBSelected = false;
  var loadingFromNetwork = false;

  void getNext() {
    // 变更值
    current = WordPair.random();
    // 推式观察者
    notifyListeners();
  }

  void toggleFavorites([ WordPair? curParam ]) {

    WordPair curVal = curParam ?? current;

    if (favorites.contains(curVal)) {
      favorites.remove(curVal);
    } else {
      favorites.add(curVal);
    }

    notifyListeners();
  }
}

// StatelessWidget 无状态 ui
class MyFirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 订阅应用实例
    var appState = context.watch<MyFirstAppState>();

    // 与具体状态分离，泛化
    var pair = appState.current;

    IconData icon;

    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    // 每个 build 方法都必须返回一个 widget 或（更常见的）嵌套 widget 树
    return Scaffold(
      body: Center(
          // Column 是 Flutter 中最基础的布局 widget 之一。它接受任意数量的子项并将这些子项从上到下放在一列中
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('一个随机的想法:'),
        const SizedBox(
          height: 10,
        ),
        BigCard(pair: pair),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                appState.toggleFavorites();
              },
              icon: Icon(icon),
              label: const Text('收藏'),
            ),
            ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('下一个')),
          ],
        )
      ])),
    );
  }
}

// 多级路由页面 StatefulWidget 获取状态
class MyFirstHomePage1 extends StatefulWidget {
  @override
  State<MyFirstHomePage1> createState() => _MyFirstHomePage1State();
}

class _MyFirstHomePage1State extends State<MyFirstHomePage1> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = GenerateorPage();
        break;
      case 1:
        page = GenerateorPage1();
        break;
      default:
        throw UnimplementedError('没有可匹配得页面实例索引 $selectedIndex');
    }

    /**
   * 每当约束发生更改时，系统都会调用 LayoutBuilder 的 builder 回调。比如说，以下场景就会触发这种情况：
  用户调整应用窗口的大小
  用户将手机从人像模式旋转到横屏模式，或从横屏模式旋转到人像模式
  MyHomePage 旁边的一些 widget 变大，使 MyHomePage 的约束变小
  其他还有很多，不再一一列举
   */
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          // 多个 Widget
          children: [
            // 避免刘海屏或者其它情况
            SafeArea(
                child:
                    // 侧边导航
                    NavigationRail(
              // 导航打开状态
              extended: constraints.maxWidth >= 600,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('主页'),
                ),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text('收藏')),
              ],
              selectedIndex: selectedIndex,
              // 点击选中的 tab 值
              onDestinationSelected: (value) {
                print('选中的值 $value');
                setState(() {
                  selectedIndex = value;
                });
              },
            )),
            Expanded(
                child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ))
          ],
        ),
      );
    });
  }
}

class GenerateorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyFirstAppState>();
    var pair = appState.current;

    IconData icon;

    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorites();
                  },
                  icon: Icon(icon),
                  label: const Text('收藏')),
              ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: const Text('新的'))
            ],
          )
        ],
      ),
    );
  }
}

class GenerateorPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyFirstAppState>();
    var favorites = appState.favorites;

    print('输入信息');

    if (favorites.isEmpty) {
      return const Center(
        child: Text('当前无收藏'),
      );
    }

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '收藏区域',
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black,
                height: 3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // for (var msg in favorites) Text(msg.asLowerCase),
            ...(favorites
                .map((item) => ListTile(
                      title: Text(item.asLowerCase),
                      leading: ElevatedButton(child: const Icon(Icons.favorite), onPressed: () {
                        appState.toggleFavorites(item);
                      },),
                    ))
                .toList()),
          ],
        )),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  //优化无障碍功能
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel:
              '${pair.first} ${pair.second}', // Flutter 提供了多种无障碍工具，包括自动化测试和 Semantics widget
        ),
      ),
    );
  }
}
