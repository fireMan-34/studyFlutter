** Widgets **
- Flutter 从 React 汲取灵感。
- 核心思想是用 widget 来构建 UI 界面， Widget 状态变更时，它会重新构建自己的展示 UI ，框架会对比前后的变化不同，以确定底层渲染树从一个状态转换到下一个状态的最小变更.

```dart
// 最小的变更
import 'package:flutter/material.dart';

void main() {
  // runApp 会传入 Widget ，使其成为 widget 树的根节点
  // 框架会逐一构建 这些 widget 直到最后一个底层描述 widget 的 RenderObject
  runApp(
    const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

## 基础 widgets

- Text 常用的创建带样式文本

- Row,Column 基于 web 的 flexbox 布局模型设计的

- Stack 是按照绘制顺序堆叠子 widget ， 可以用 Postioned widget 作为 子 widget 来相对定位

- Container 可以用来创建一个可见的矩形元素， 可以使用 BoxDecoration 来进行装饰背景，边框，或者阴影。还可以设置外边距，内边距和尺寸约束。


## 状态

setState 状态变更，给对应状态打印脏标记，通知框架更新状态，如果不用 setState 会静默更新