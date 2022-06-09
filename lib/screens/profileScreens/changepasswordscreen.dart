import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white, primary: Theme.of(context).primaryColor),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text('Update'),
          ),
        ),
      ),
      appBar: AppBar(
          title: const Text(
        'Change Password',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      )),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: const Color.fromRGBO(30, 26, 26, 0.6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('Old Password',
                        style:
                            TextStyle(color: Color.fromRGBO(30, 26, 26, 0.6))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintText: ' ', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: const Color.fromRGBO(30, 26, 26, 0.6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('New Password',
                        style:
                            TextStyle(color: Color.fromRGBO(30, 26, 26, 0.6))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintText: ' ', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: const Color.fromRGBO(30, 26, 26, 0.6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('Confirm Password',
                        style:
                            TextStyle(color: Color.fromRGBO(30, 26, 26, 0.6))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintText: ' ', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
