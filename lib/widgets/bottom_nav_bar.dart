import 'package:flutter/material.dart';
import 'package:study_base_flutter/screens/home_screen.dart';
import 'package:study_base_flutter/screens/profile_screen.dart';
import 'package:study_base_flutter/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // ignore: avoid_unnecessary_containers
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: 'New & Hot',
              )
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            SearchScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
