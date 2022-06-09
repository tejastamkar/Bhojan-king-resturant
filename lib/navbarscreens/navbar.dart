import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/navbarscreens/cart.dart';
import 'package:restroapp/navbarscreens/homescreen.dart';
import 'package:restroapp/navbarscreens/search.dart';
import 'package:restroapp/navbarscreens/shoppingwindow.dart';
import 'package:restroapp/widgets/clippath.dart';

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
    const StreetVendors()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Column(
                    children: [
                      (SvgPicture.asset('navicons/home.svg')),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      (SvgPicture.asset(
                        'navicons/home.svg',
                        color: Colors.grey,
                      )),
                      const Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Column(
                    children: [
                      (SvgPicture.asset(
                        'navicons/search.svg',
                        color: Theme.of(context).primaryColor,
                      )),
                      Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      (SvgPicture.asset(
                        'navicons/search.svg',
                        color: Colors.grey,
                      )),
                      const Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Column(
                    children: [
                      (SvgPicture.asset(
                        'navicons/Cart.svg',
                        color: Theme.of(context).primaryColor,
                      )),
                      Text(
                        'Cart',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      (SvgPicture.asset('navicons/Cart.svg')),
                      const Text(
                        'Cart',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        (SvgPicture.asset(
                          'navicons/ShopWindow.svg',
                          color: Theme.of(context).primaryColor,
                        )),
                        Text(
                          'Street Viendors',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor),
                        ),
                        SvgPicture.asset(
                          'icons/curve.svg',
                          width: 80,
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      (SvgPicture.asset(
                        'navicons/ShopWindow.svg',
                        color: Colors.grey,
                      )),
                      const Text(
                        'Street Viendors',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SvgPicture.asset(
                        'icons/curve.svg',
                        width: 80,
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
            label: '',
          ),
        ],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
