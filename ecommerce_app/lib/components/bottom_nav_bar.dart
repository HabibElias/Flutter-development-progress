import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNav({required this.onTabChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: GNav(
        padding: const EdgeInsets.all(20.0),
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        tabBorderRadius: 15,
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 4,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'home',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: "cart",
          ),
        ],
      ),
    );
  }
}
