import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hiky/Screens/BottomNavBars/hometab.dart';
import 'package:hiky/Screens/BottomNavBars/notification.dart';
import 'package:hiky/Screens/BottomNavBars/places.dart';
import 'package:hiky/Screens/BottomNavBars/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;
  List<Widget> _tabViews = [
    HomeTab(),
    PlacesTab(),
    NotificationTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              backgroundColor: Colors.white,
              gap: 4,
              color: Colors.teal,
              activeColor: Colors.teal,
              iconSize: 30,
              tabBackgroundColor: Colors.grey,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              padding: const EdgeInsets.all(16.0),
              tabs: const [
                GButton(icon: Icons.home_rounded, text: "home"),
                GButton(icon: Icons.place_sharp, text: "places"),
                GButton(icon: Icons.notifications, text: "notifications"),
                GButton(icon: Icons.person_2_rounded, text: "profile"),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _tabViews,
        ),
      ),
    );
  }
}
