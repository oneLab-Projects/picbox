import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/common/design/clear_behavior.dart';
import 'package:picbox/tabs/five_tab.dart';
import 'package:picbox/tabs/four_tab.dart';
import 'package:picbox/tabs/one_tab.dart';
import 'package:picbox/tabs/three_tab.dart';
import 'package:picbox/tabs/two_tab.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ClearBehavior(),
          child: child,
        );
      },
      title: 'Picbox',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController tabController;

  final List<Widget> tabs = [
    OneTab(),
    TwoTab(),
    ThreeTab(),
    FourTab(),
    FiveTab(),
  ];

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(children: tabs, controller: tabController),
      ),
      bottomSheet: navBar(),
    );
  }

  navBar() {
    return Container(
      height: 50,
      color: Colors.grey[900],
      child: TabBar(
        controller: tabController,
        indicatorWeight: 0.01,
        tabs: [
          Tab(child: Icon(MdiIcons.homeVariantOutline)),
          Tab(child: Icon(Icons.search)),
          Tab(child: Icon(MdiIcons.cardsOutline)),
          Tab(child: Icon(MdiIcons.bellOutline)),
          Tab(child: Icon(MdiIcons.accountCircleOutline)),
        ],
      ),
    );
  }
}
