import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action/action_page.dart';
import 'plan_page.dart';
import 'statistic_page.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  final List<Widget> _pageList = [
    PlanPage(),
    ActionPage(),
    StatisticPage()
  ];
  final List<String> _tabLabels = ["计划", "动作", "分析"];
  final List<Image> _tabIcon = [
    Image.asset("assets/icon/gym.png", height: 24.r, width: 24.r),
    Image.asset("assets/icon/dumbbell.png", height: 24.r, width: 24.r),
    Image.asset("assets/icon/report.png", height: 24.r, width: 24.r),
  ];
  final PageController _pageControl = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: _buildBottomNavigationItems(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        onTap: (index) {
          _pageControl.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageControl,
        children: _pageList,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationItems() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < _tabLabels.length; i++) {
      items.add(
        BottomNavigationBarItem(icon: _tabIcon[i], label: _tabLabels[i]),
      );
    }
    return items;
  }
}
