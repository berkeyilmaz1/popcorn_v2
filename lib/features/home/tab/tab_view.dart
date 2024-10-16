import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/home/tab/enum/tab_enums.dart';
import 'package:popcorn_v2/features/home/view/home_view.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';

final class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabEnum.values.length,
      initialIndex: TabEnum.home.index,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: ProductColors.black.withOpacity(0.2),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.bookmark_rounded),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics( ),
          children: [
            Placeholder(),
            HomeView(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
