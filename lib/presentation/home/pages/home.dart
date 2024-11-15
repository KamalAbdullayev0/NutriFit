import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DietRouteWidget(),
        SportRouteWidget(),
        LocationRouteWidget(),
        ProfilRouteWidget(),
      ],
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 10),
            child: GNav(
              onTabChange: (index) => _openPage(index, tabsRouter),
              selectedIndex: tabsRouter.activeIndex,
              color: Colors.grey[500],
              activeColor: Colors.green[400],
              tabBackgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              duration: const Duration(milliseconds: 300),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: ' Diet',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: ' Sport',
                ),
                GButton(
                  icon: Icons.location_on,
                  text: ' Location',
                ),
                GButton(
                  icon: Icons.person,
                  text: ' Profil',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
