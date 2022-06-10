import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restroapp/screens/profileScreens/bookinghistroyscreen.dart';
import 'package:restroapp/screens/profileScreens/favscreen.dart';
import 'package:restroapp/screens/profileScreens/helpsupportscreen.dart';
import 'package:restroapp/screens/profileScreens/notifications.dart';
import 'package:restroapp/screens/profileScreens/orderhistoryscreen.dart';
import 'package:restroapp/screens/profileScreens/profile_editscreen.dart';
import 'package:restroapp/screens/profileScreens/savedaddress.dart';
import 'package:restroapp/screens/settingscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String name = 'Rohan', email = 'rohan1899@gmail.com';
  final int number = 9819233949;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: width < 440 ? width / 1.8 : width / 3.7,
                  child: Image.asset(
                    'assets/profilebg.png',
                    fit: BoxFit.cover,
                    width: width,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (() => Navigator.pop(context)),
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: SvgPicture.asset(
                                  'icons/chevron-down.svg',
                                  color: Colors.white,
                                )),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileEditScreen(),
                              ),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$number',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: 10,
                            height: 10,
                          ),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryScreen(),
                  ))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/Order.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Order History',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            InkWell(
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingHistoryScreen(),
                  ))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/Booking.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Booking History',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            InkWell(
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavScreen(),
                  ))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/Favourities.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Favourities',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            InkWell(
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedAddressScreen(),
                  ))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/Saved.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Saved Address',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            InkWell(
              onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsScreen()),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/bell.svg',
                        color: Theme.of(context).primaryColor),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Notifications',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            InkWell(
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/settings.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            InkWell(
              onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelpSupportScreen()),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset('icons/Help.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Help & Support',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    const Spacer(),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SvgPicture.asset(
                        'icons/chevron-down.svg',
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SvgPicture.asset('icons/Return Policy.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Return Policy',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: 3,
                    child: SvgPicture.asset(
                      'icons/chevron-down.svg',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SvgPicture.asset('icons/tandcicon.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Terms & Condition',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: 3,
                    child: SvgPicture.asset(
                      'icons/chevron-down.svg',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SvgPicture.asset('icons/log-out.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Logout',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: 3,
                    child: SvgPicture.asset(
                      'icons/chevron-down.svg',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
