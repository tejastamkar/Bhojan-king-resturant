import 'package:flutter/material.dart';
import 'package:restroapp/navbarscreens/navbar.dart';
import 'package:restroapp/screens/signinscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(120)),
                  child: Image.asset(
                    'icons/bgLogin.png',
                    fit: BoxFit.cover,
                  )),
              Column(
                children: [
                  SizedBox(
                    height: height / 5,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width / 20, 0, width / 20, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('Login',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            30, 26, 26, 0.6))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text('Mobile Number',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  30, 26, 26, 0.6))),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                              hintText: ' ',
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            30, 26, 26, 0.6))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text('Password',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  30, 26, 26, 0.6))),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                              hintText: ' ',
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forget Password ?',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (contect) =>
                                            const NavBarScreen()));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 6),
                                child: Text(
                                  "Login",
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(30),
                              child: Text('or',
                                  style: TextStyle(
                                      color: Color.fromRGBO(14, 11, 11, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contect) =>
                                              const NavBarScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white,
                                  side: const BorderSide(
                                    color: Color.fromRGBO(167, 43, 67, 0.2),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      Image.asset(
                                        'icons/googleicon.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                      const Spacer(flex: 1),
                                      const Text(
                                        'Continue with Google',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(14, 11, 11, 0.9),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(flex: 2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(167, 43, 67, 0.2),
                                    width: 1,
                                  ),
                                  top: BorderSide(
                                    color: Color.fromRGBO(167, 43, 67, 0.2),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextButton(
                                  child: const Text(
                                    'Create a Account',
                                    style: TextStyle(
                                        color: Color.fromRGBO(167, 43, 67, 1)),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contect) =>
                                                const SignInScreen()));
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
