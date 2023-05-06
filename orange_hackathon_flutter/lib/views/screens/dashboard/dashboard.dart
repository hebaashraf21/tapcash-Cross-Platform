//we need to make a buttom navigation bar to navigate between the pages
//we have 4 main pages and a middle notched button to add a new transaction
//home, insights, cards, Settings

import 'package:flutter/material.dart';
import 'package:orange_hackathon_flutter/models/dashboard/dashboard_home_model.dart';
import 'package:orange_hackathon_flutter/views/widgets/dashboard_insights_graph.dart';

// import '../../widgets/dashboard_insights.dart';
import 'dashboard_home.dart';
import 'dashboard_insights.dart';
// import 'package:orange_hackathon_flutter/views/screens/dashboard/dashboard_home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const routename = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardHome(),
    // Text("Insights Page"),
    // DashboardInsights(),
    // Text('Insights Page'),
    DashboardInsights(),
    Text('Scan transaction'),
    Text('Cards Page'),
    Text('Settings Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TAPcash'),
      // ),
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          Positioned(
            //make bottom navigation at bottom of the screen
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: home_icon, label: 'Home'),
                BottomNavigationBarItem(icon: insights_icon, label: 'Insights'),
                BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
                BottomNavigationBarItem(icon: card_icon, label: 'Cards'),
                BottomNavigationBarItem(icon: user_icon, label: 'Profile'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF333E96),
              unselectedItemColor: Color(0xFF1A1A1A),
              onTap: _onItemTapped,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                () {};
              },
              child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: qr_gradient,
                    // color: Color.fromARGB(a, r, g, b),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: qr_icon),
            ),
          ),
        ],
      ),
    );
  }
}
