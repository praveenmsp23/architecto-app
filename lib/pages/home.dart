import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          _tabs[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              child: GNav(
                gap: 8,
                activeColor: CupertinoColors.white,
                color: CupertinoColors.systemGrey,
                backgroundColor: CupertinoColors.activeBlue,
                tabBackgroundColor: CupertinoColors.activeBlue.withOpacity(0.6),
                padding: EdgeInsets.all(16),
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                tabs: [
                  GButton(
                    icon: CupertinoIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: CupertinoIcons.person,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
