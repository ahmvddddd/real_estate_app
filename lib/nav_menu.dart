import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'screens/home/home_screen.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/sizes.dart';
import 'utils/helpers/helper_function.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {
  
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    final selectedIndex = ref.watch(selectedIndexProvider);

    Widget currentScreen() {
      switch (selectedIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const HomeScreen();
        case 2:
          return HomeScreen();
        case 3:
          return const HomeScreen();
        default:
          return const HomeScreen();
      }
    }
    return Scaffold(
        body: currentScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            ref.read(selectedIndexProvider.notifier).state = index;
          },
          backgroundColor: darkMode ? CustomColors.dark : CustomColors.light,
          selectedItemColor:CustomColors.primary,
          unselectedItemColor:
              darkMode ? CustomColors.darkGrey : CustomColors.darkerGrey,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.home_15, size: Sizes.iconM),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal, size: Sizes.iconM),
              label: 'Search',
            ),const BottomNavigationBarItem(
              icon: Icon(Icons.clean_hands, size: Sizes.iconM),
              label: 'Services',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list, size: Sizes.iconM),
              label: 'List Property',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.more_vert, size: Sizes.iconM),
              label: 'More',
            ),
          ],
        ),
      );
  }
}