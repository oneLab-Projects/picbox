import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/tabs/home.dart';
import 'package:picbox/src/tabs/notifications.dart';
import 'package:picbox/src/tabs/profile.dart';
import 'package:picbox/src/tabs/search.dart';
import 'package:picbox/src/tabs/view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController tabController;
  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    ViewTab(),
    NotificationsTab(),
    ProfileTab(),
  ];

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  navBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: TabBar(
            controller: tabController,
            indicatorWeight: 0.01,
            tabs: [
              Tab(child: Icon(MdiIcons.compassOutline)),
              Tab(child: Icon(Icons.search)),
              Tab(child: Icon(MdiIcons.cardsOutline)),
              Tab(child: Icon(MdiIcons.bellOutline)),
              Tab(child: Icon(MdiIcons.accountCircleOutline)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          TabBarView(
            children: tabs,
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
          ),
          navBar(),
        ],
      ),
    );
  }
}
