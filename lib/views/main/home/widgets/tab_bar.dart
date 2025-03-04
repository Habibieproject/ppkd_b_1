import 'package:flutter/material.dart';
import 'package:ppkd_b_1/views/main/school/widgets/map_widget.dart';
import 'package:ppkd_b_1/views/main/stack/widgets/layouting/gridview.dart';

/// Flutter code sample for [TabBar].

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Primary and secondary TabBar'),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(text: 'Flights', icon: Icon(Icons.flight)),
              Tab(text: 'Trips', icon: Icon(Icons.luggage)),
              Tab(text: 'Explore', icon: Icon(Icons.explore)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Flights'),
            NestedTabBar('Trips'),
            NestedTabBar('Explore'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: <Widget>[
            GestureDetector(
              onTap: () {
                // setState(() {});
                // _tabController.animateTo(0);
              },
              child: Container(
                color: _tabController.index == 0 ? Colors.white : Colors.grey,
                padding: EdgeInsets.all(8),
                child: Text('Gridview'),
              ),
            ),
            InkWell(
              onTap: () {
                // setState(() {});
                // _tabController.animateTo(1);
              },
              child: Container(
                color: _tabController.index == 1 ? Colors.white : Colors.grey,

                padding: EdgeInsets.all(8),
                child: Text('List Map'),
              ),
            ),
            // Tab(text: 'Overview'),
            // Tab(text: 'Specifications'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[GridviewScreen(), ListMapWidget()],
          ),
        ),
      ],
    );
  }
}
