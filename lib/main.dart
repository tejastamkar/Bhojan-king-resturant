import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:restroapp/screens/loginscreen.dart';
// import 'package:restroapp/screens/signinpage.dart';

void main() {
  runApp(
    MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(child,
                maxWidth: 1920,
                minWidth: 360,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(360, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(720, name: TABLET),
                  const ResponsiveBreakpoint.resize(1080, name: DESKTOP)
                ]),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black),
          primaryColor: const Color.fromRGBO(179, 19, 64, 1),
          primaryColorLight: const Color.fromRGBO(254, 251, 251, 1),
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black),
          ),
        ),
        home: const Main()),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return const LoginScreen();
  }
}
