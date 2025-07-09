import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning/pages/page_four/page_four.dart';
import 'package:learning/pages/page_one/page_one.dart';
import 'package:learning/pages/page_three.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learning/pages/page_two/page_two.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildGNavIcon(String path, bool isSelected) {
  return SvgPicture.asset(
    path,
    height: 24,
    colorFilter: ColorFilter.mode(
      isSelected ? Colors.orange : Color(0xFFB2B2B2),
      BlendMode.srcIn,
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: TabBarView(
      controller: _tabController,
      children: [
        PageOne(),
        PageTwo(),
        PageThree(),
        PageFour(),
      ],
    ),
    bottomNavigationBar: Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
  setState(() {
    _selectedIndex = index;
    _tabController.index = index; // ini yang bikin TabBarView ikut berubah
  });
},
  rippleColor: Colors.orange, // tab button ripple color when pressed
  hoverColor: Colors.orange, // tab button hover color
  haptic: true, // haptic feedback
  tabBorderRadius: 100, 
  // tabActiveBorder: Border.all(color: Colors.orange, width: 1), // tab button border
  // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
  // tabShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)], // tab button shadow
  curve: Curves.easeOutExpo, // tab animation curves
  duration: Duration(milliseconds: 900), // tab animation duration
  gap: 8, // the tab button gap between icon and text 
  color: Color(0xFFB2B2B2), // unselected icon color
  activeColor: Colors.orange, // selected icon and text color
  iconSize: 10, // tab button icon size
  tabBackgroundColor: Color(0x1AFF5500), // selected tab background color
  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  tabMargin: EdgeInsets.symmetric(horizontal: 10),// navigation bar padding
  tabs: [
    GButton(
      icon: Icons.circle,
      leading: buildGNavIcon('assets/icons/home.svg', _selectedIndex == 0),
      text: 'Home',
    ),
    GButton(
      icon: Icons.circle,
      leading: buildGNavIcon('assets/icons/bag.svg', _selectedIndex == 1),
      text: 'Cart',
    ),
    GButton(
      icon: Icons.circle,
      leading: buildGNavIcon('assets/icons/heart.svg', _selectedIndex == 2),
      text: 'Favorite',
    ),
    GButton(
      icon: Icons.circle,
      leading: buildGNavIcon('assets/icons/profile.svg', _selectedIndex == 3),
      text: 'Profile',
    ),
  ]
)
    ),
  );
  }
}