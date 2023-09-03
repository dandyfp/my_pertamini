import 'package:flutter/material.dart';
import 'package:my_pertamini/src/helpers/scalable_dp_helper.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/views/cart/cart_view.dart';
import 'package:my_pertamini/src/iu/views/home/home_view.dart';
import 'package:my_pertamini/src/iu/views/pos/pos_view.dart';
import 'package:my_pertamini/src/iu/views/profile/profile_view.dart';

class MainView extends StatefulWidget {
  static const String routeName = "/main-view";
  final String admin;
  const MainView({
    super.key,
    required this.admin,
  });

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
  List<Widget> pagesAdmin = <Widget>[
    const HomeView(),
    const PosView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    SDP.init(context);

    return Scaffold(
      body: Center(
        child: widget.admin == 'admin' ? pagesAdmin.elementAt(_selectedIndex) : pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: BaseColors.primaryBlue,
            ),
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              widget.admin == 'admin' ? Icons.post_add : Icons.input_outlined,
              color: BaseColors.primaryBlue,
            ),
            label: widget.admin == 'admin' ? 'Laporan' : 'Transaction',
            icon: Icon(
              widget.admin == 'admin' ? Icons.post_add : Icons.input_outlined,
            ),
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.emoji_people_sharp,
              color: BaseColors.primaryBlue,
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
