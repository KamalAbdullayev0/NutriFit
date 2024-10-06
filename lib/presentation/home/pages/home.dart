import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nutri_fit/presentation/home/pages/ic/diet_page.dart';
import 'package:nutri_fit/presentation/home/pages/ic/location_page.dart';
import 'package:nutri_fit/presentation/home/pages/ic/profil_page.dart';
import 'package:nutri_fit/presentation/home/pages/ic/sport_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
      _pageController.jumpToPage(index); // Переключаем страницу в PageView
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        children: const [
          DietPageWidget(),
          SportPageWidget(),
          LocationPageWidget(),
          ProfilPageWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: onSelectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Sport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
