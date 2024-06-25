import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/theme.dart';
import 'build_attending_list_view.dart';

class BuildCustomTabBar extends StatefulWidget {
  const BuildCustomTabBar({super.key});

  @override
  State<BuildCustomTabBar> createState() => _BuildCustomTabBarState();
}

class _BuildCustomTabBarState extends State<BuildCustomTabBar> with SingleTickerProviderStateMixin {

  late TabController _tabController;

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

    final themeStyle = ThemeStylesProfiles(color: AppTheme.lightGray);

    return Column(
      children: [
        Container(
          height: 50,
          color: AppTheme.jet,
          child: TabBar(
            controller: _tabController,
            // indicatorColor: AppTheme.dullGold,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: AppTheme.jet,
            indicator: const BoxDecoration(
              color: AppTheme.dullGold
            ),
            labelStyle: themeStyle.primaryTitle,
            unselectedLabelColor: AppTheme.white,
            labelColor: AppTheme.white,
            tabs: const [
              Tab(text: 'GALLERY'),
              Tab(text: 'ATTENDING')
            ]
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.transparent,
                  child: const Center(child: Text('TODO...')),
                ),

                const BuildAttendingListView()
              ],
            )
          ),
        )
      ],
    );
  }
}