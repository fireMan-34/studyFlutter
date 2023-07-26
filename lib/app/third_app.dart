import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void runThirdApp() {
  runApp(const ThirdApp());
}

class ThirdApp extends StatelessWidget {
  const ThirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleLine = Container(
      padding: const EdgeInsets.all(32),
      child: Row(children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                '标题',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              '副标题',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )),
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const Text('1'),
      ]),
    );

    Column buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    Widget buttonLine = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(color, Icons.call, '电话'),
        buildButtonColumn(color, Icons.near_me, '短信'),
        buildButtonColumn(color, Icons.share, '分享'),
      ],
    );

    Widget textLine = const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          'Invidunt magna tempor accusam lorem. Et invidunt ipsum stet et consetetur amet no duo lorem quod et at dolor. At dolor vel diam ut augue ipsum nulla feugiat dolore diam ea sea magna molestie aliquip. Consetetur dolor elit diam stet aliquyam vel rebum sed consetetur. Erat nulla molestie elit ipsum vel lorem duo tincidunt lorem et. Sed sit odio dolore tempor sit sadipscing consequat congue. Lorem dolor consectetuer dolore consetetur nonummy et dolor diam tation blandit. Iriure takimata ad consetetur eum te eleifend ut magna amet. Dolore diam option in lorem augue. Duis elit sadipscing dolores feugait. Sit diam eirmod cum et. Laoreet no dolore autem aliquip rebum sit sadipscing.',
          softWrap: true,
        ));

    return ChangeNotifierProvider(
        create: (context) => ThirdAppState(),
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('测试布局标题-1'),
            ),
            // 似乎布局用 Center 死活出不来这个
            body: ListView(children: [
              Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleLine,
              buttonLine,
              textLine
            ]),
          ),
        ));
  }
}

class ThirdAppState extends ChangeNotifier {}
