
void simplelog (String msg) {
  print('log:自定义输出$msg');
}

class SimplePersion {
  final String name;
  final int age;

  // 简单初始化
  SimplePersion(this.name, this.age);

  void say () {
    simplelog('我是 $name , 今年 $age');
  }

  void print () {
    simplelog('自定义打印');
  }
}