import 'package:flutter/material.dart';
import 'package:skinfirst/constants.dart';
import 'package:skinfirst/views/appointment/appointment_view.dart';
import 'package:skinfirst/views/home/home_screen_view.dart';
import 'package:skinfirst/views/profile/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<Widget> pages = [
   HomeScreenView(),
   Center(child: Text("Search"),),
   ProfileView(),
   AppointmentView()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),

        body: pages[_selectedIndex],

        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0, 
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center( 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.22, 
                  decoration: BoxDecoration(
                    color: appTheme,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(Icons.home, "Home", 0),
                      _buildNavItem(Icons.chat_bubble_outline_sharp, "Search", 1),
                      _buildNavItem(Icons.person, "Profile", 2),
                      _buildNavItem(Icons.calendar_month, "Appointments", 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.white : Colors.white70, 
            size: 24,
          ),
        ],
      ),
    );
  }

}


