import 'package:flutter/material.dart';
import 'package:supcoder_blog/common/res/images.dart';
import 'package:supcoder_blog/page/blog_list_page.dart';
import 'package:supcoder_blog/page/main/MainPage.dart';

import 'find_page.dart';
import 'mine_page.dart';

class MainGroupPage extends StatefulWidget {
  MainGroupPage();

  @override
  State<StatefulWidget> createState() {
    return new _MainBottomTab();
  }
}

class _MainBottomTab extends State<MainGroupPage> {
  //当前按下的坐标
  int position = 0;

  //文字资源
  var _dataTab;

  //图片资源
  var _dataIcon;

  //页面
  var _dataPage;
  var parentContext;

  //按下tab的处理
  void _clickTab(int index) {
    setState(() {
      position = index;
      print("按下的Index:$index \t position:$position");
    });
  }

  //初始化数据
  void _initTab() {
    _dataTab = ["首页", "发现", "我的"];
    _dataIcon = [
      [Images.main_nor, Images.main],
      [Images.find_nor, Images.find],
      [Images.me_nor, Images.me]
    ];
    _dataPage = [
      new MainPage(fContext: parentContext),
      new BlogListPage(),
      new MindPage()
    ];
  }

  //选择图片
  Image getIcon(int index) {
    //判断是否是选中的下标，如果是就用选中的icon
    String select =
        index == position ? _dataIcon[index][1] : _dataIcon[index][0];
    return new Image.asset(select, width: 20, height: 20);
  }

  //字体
  Text getText(int index) {
    //如果是选中的就用选中的颜色字体
    Color textColor =
        index == position ? new Color(0xff1296db) : Colors.black87;
    return new Text(
      _dataTab[index],
      style: new TextStyle(fontSize: 12, color: textColor //我们设置的颜色
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    parentContext = context;
    _initTab();
    return new Scaffold(
      body: _dataPage[position],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(icon: getIcon(0), title: getText(0)),
          new BottomNavigationBarItem(icon: getIcon(1), title: getText(1)),
          new BottomNavigationBarItem(icon: getIcon(2), title: getText(2))
        ],
        onTap: _clickTab, //选择按下的处理
        currentIndex: position, //当前按下
      ),
    );
  }
}

class _BarBean {
  Icon icon;
  String title;
}
