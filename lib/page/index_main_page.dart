

import 'package:flutter/material.dart';
import 'package:supcoder_blog/widget/blog_brief_item.dart';

class IndexMainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DemoPageState();
  }
  
}

class _DemoPageState extends State<IndexMainPage> {
  @override
  Widget build(BuildContext context) {
    ///一个页面的开始
    ///如果是新页面，会自带返回按键
    return new Scaffold(
      ///背景样式
      backgroundColor: Colors.blue,
      ///标题栏，当然不仅仅是标题栏
      appBar: new AppBar(
        ///这个title是一个Widget
        title: new Text("Title"),
      ),
      ///正式的页面开始
      ///一个ListView，20个Item
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new BlogBriefsItem(null);
        },
        itemCount: 20,
      ),
    );
  }
}