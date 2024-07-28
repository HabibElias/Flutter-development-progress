import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // attributes for the pages navigation
  int _selectedIndex = 0;

  void navigationIndexChanger(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages
  final List<Widget> pages = const [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        }),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 180,
                  margin: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Image.asset(
                    'lib/images/nike.png',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                // the home and shop

                // home page
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'H O M E',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // About page
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'A B O U T',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Logout page
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'L O G O U T',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNav(
        onTabChange: (index) => navigationIndexChanger(index),
      ),
    );
  }
}
