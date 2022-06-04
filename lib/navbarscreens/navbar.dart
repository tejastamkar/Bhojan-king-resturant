import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/navbarscreens/cart.dart';
import 'package:restroapp/navbarscreens/homescreen.dart';
import 'package:restroapp/navbarscreens/search.dart';
import 'package:restroapp/navbarscreens/shoppingwindow.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;
  String appBarTitle = 'Home';
  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ShoppingWindowScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? (SvgPicture.asset('navicons/home.svg'))
                : (SvgPicture.asset(
                    'navicons/home.svg',
                    color: Colors.grey,
                  )),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? (SvgPicture.asset('navicons/search.svg',
                    color: Theme.of(context).primaryColor))
                : (SvgPicture.asset(
                    'navicons/search.svg',
                    color: Colors.grey,
                  )),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? (SvgPicture.asset('navicons/Cart.svg',
                    color: Theme.of(context).primaryColor))
                : (SvgPicture.asset(
                    'navicons/Cart.svg',
                    color: Colors.grey,
                  )),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? (SvgPicture.asset(
                    'navicons/ShopWindow.svg',
                    color: Theme.of(context).primaryColor,
                  ))
                : (SvgPicture.asset(
                    'navicons/ShopWindow.svg',
                    color: Colors.grey,
                  )),
            label: 'Street Vendors',
          ),
        ],
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromRGBO(165, 153, 153, 1),
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          }),
          // changeAppBarTitle(inDexNumber: _selectedIndex)
        },
      ),
    );
  }
}
