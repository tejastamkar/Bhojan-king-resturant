import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
       
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.width < 440? MediaQuery.of(context).size.width /1.8 : MediaQuery.of(context).size.width / 4,
                  child: Image.asset(
                    'assets/profilebg.png',
                    fit: BoxFit.cover,
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
                              onPressed: () {},
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ))
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
                          style: const TextStyle(color: Colors.white , fontSize: 14 , fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            width: 10,
                            height: 10,
                          ),
                        ), Text(
                          email,
                          style: const TextStyle(color: Colors.white , fontSize: 14 , fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ), 
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [ 
                  SvgPicture.asset('icons/Order.svg'), 
                  const SizedBox(
                    width:  10 ,
                  ), 
                  const Text('Order History' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
                height: 1, 
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [ 
                  SvgPicture.asset('icons/Booking.svg'), 
                  const SizedBox(
                    width:  10 ,
                  ), 
                  const Text('Booking History' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
                height: 1, 
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [ 
                  SvgPicture.asset('icons/Favourities.svg'), 
                  const SizedBox(
                    width:  10 ,
                  ), 
                  const Text('Favourities' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
                height: 1, 
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [ 
                  SvgPicture.asset('icons/Saved.svg'), 
                  const SizedBox(
                    width:  10 ,
                  ), 
                  const Text('Saved Address' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
                height: 1, 
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [ 
                  SvgPicture.asset('icons/bell.svg' , color: Theme.of(context).primaryColor), 
                  const SizedBox(
                    width:  10 ,
                  ), 
                  const Text('Notifications' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
                height: 1, 
                color: const Color.fromRGBO(196, 196, 196, 0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [ 
                  SvgPicture.asset('icons/Help.svg'), 
                  const SizedBox(
                    width:  10 ,
                  ), 
                  const Text('Help & Support' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
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
                    width:  10 ,
                  ), 
                  const Text('Return Policy' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
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
                    width:  10 ,
                  ), 
                  const Text('Terms & Condition' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
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
                    width:  10 ,
                  ), 
                  const Text('Logout' , style:TextStyle( fontWeight:  FontWeight.w400 , fontSize: 18)) , 
                  const Spacer(), 
                  RotatedBox(quarterTurns: 3 , child:  SvgPicture.asset('icons/chevron-down.svg' , color:  Colors.black,),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal:  20),
              child: Container( 
                width:  MediaQuery.of(context).size.width,
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
