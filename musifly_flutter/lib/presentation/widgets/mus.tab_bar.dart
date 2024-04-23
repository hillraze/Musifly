import 'package:flutter/material.dart';
import 'package:musifly/presentation/widgets/mus.app_bar.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: 'New'),
              Tab(text: 'Genres'),
            ]),
            title: const MusAppBar(),
          ),
          body: TabBarView(children: []),
        ));
  }
}
