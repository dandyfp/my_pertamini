import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/views/cart/cart_view.dart';
import 'package:my_pertamini/src/iu/views/home/home_view.dart';
import 'package:my_pertamini/src/iu/views/profile/profile_view.dart';

class MainView extends StatefulWidget {
  static const String routeName = "/main-view";
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = <Widget>[
    const HomeView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    SDP.init(context);

    return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: BaseColors.primary,
            ),
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              color: BaseColors.primary,
            ),
            label: 'Keranjang',
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.emoji_people_sharp,
              color: BaseColors.primary,
            ),
            label: 'Profile',
            icon: Icon(
              Icons.emoji_people_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
