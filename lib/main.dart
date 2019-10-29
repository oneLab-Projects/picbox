import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/common/design/clear_behavior.dart';
import 'package:picbox/tabs/home_tab.dart';
import 'package:picbox/tabs/notifications_tab.dart';
import 'package:picbox/tabs/profile_tab.dart';
import 'package:picbox/tabs/search_tab.dart';
import 'package:picbox/tabs/view_tab.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.grey[900],
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

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
