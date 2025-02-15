import 'package:flutter/material.dart';
import 'package:foodiemate/screens/bagscreens/cart_screen.dart';
import 'package:foodiemate/screens/homescreens/home_screen_ui.dart';
import 'package:foodiemate/screens/orderscreens/my_orders_screen.dart';
import 'package:foodiemate/screens/profilescreens/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    HomeScreenUi(),
    CartScreen(),
    MyOrdersScreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: "Bag"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper,
              ),
              label: "Orders"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        // selectedLabelStyle:
        //     TextStyle(color: Colors.green), // Custom color for selected label
        // unselectedLabelStyle: TextStyle(color: Colors.red),
        onTap: _onItemTapped,
        // showSelectedLabels: true,
        // showUnselectedLabels: false,
      ),
    );
  }
}
