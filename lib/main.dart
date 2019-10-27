import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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

  final List<Widget> tabs = <Widget>[
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
    return Material(
      color: Colors.red,
      child: Container(
        height: 50,
        padding: EdgeInsets.only(top: 2),
        child: TabBar(
          controller: tabController,
          tabs: [
            Tab(child: Icon(MdiIcons.homeVariantOutline)),
            Tab(child: Icon(Icons.search)),
            Tab(child: Icon(MdiIcons.cards)),
            Tab(child: Icon(Icons.notifications)),
            Tab(child: Icon(Icons.account_circle)),
          ],
        ),
      ),
    );
  }
}
