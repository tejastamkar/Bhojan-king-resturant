import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
 

    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
        });
       
      } else {
        setState(() {
          isSwitched = false;
         
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
              const   Text(
                  'Activate all Notification',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
               const  Spacer(),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.yellow,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
