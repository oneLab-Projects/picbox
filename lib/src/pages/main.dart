import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/pages/tabs.dart';

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
    DebugTab(),
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
              Tab(child: Icon(MdiIcons.bugOutline)),
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
          ),
          navBar(),
        ],
      ),
    );
  }
}
