import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    String name = "Rohan Nivale" , email = "rohanivale@gmail.com" , phone = '1234567890';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Order History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Center(
            child: Column(children: [
              SvgPicture.asset(
                'icons/profile-circle.svg',
                width: width / 4,
                height: width / 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Change Profile Picture',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: const Color.fromRGBO(30, 26, 26, 0.6))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                     const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Name',
                            style: TextStyle(
                                color: Color.fromRGBO(30, 26, 26, 0.6))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            initialValue: name,
                            onChanged: (value){ 
                              setState(() {
                                name = value ;
                              });
                            },
                            style: const TextStyle(
                              
                                fontSize: 20, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                           
                               border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: const Color.fromRGBO(30, 26, 26, 0.6))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Phone number',
                            style: TextStyle(
                                color: Color.fromRGBO(30, 26, 26, 0.6))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            
                            keyboardType: TextInputType.number,
                            initialValue: phone,
                            onChanged: (value){ 
                              setState(() {
                                phone =value; 
                              });
                            },
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                            
                              border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: const Color.fromRGBO(30, 26, 26, 0.6))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Email ID',
                            style: TextStyle(
                                color: Color.fromRGBO(30, 26, 26, 0.6))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            initialValue: email,
                            onChanged: (value){ 
                              setState(() {
                                email = value ;
                              });
                            },
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                                hintText: ' ', border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
