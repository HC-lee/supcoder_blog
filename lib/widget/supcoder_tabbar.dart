import 'package:flutter/material.dart';
import 'package:supcoder_blog/entity/tab_eneity.dart';

class SupTabBar extends StatefulWidget {
  final List<TabItemEntity> tabItems;

  SupTabBar(this.tabItems);

  @override
  State<StatefulWidget> createState() {
    return new _TabBarState(tabItems);
  }
}

class _TabBarState extends State<SupTabBar> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<TabItemEntity> _tabItems;

  _TabBarState(this._tabItems);

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///底部TabBar模式
    return null;
  }
}
