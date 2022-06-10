import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

String userProfileImagePath = '';
bool checkUserProfileImagePath = true;

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    String name = "Rohan Nivale",
        email = "rohanivale@gmail.com",
        phone = '1234567890';

    Future<dynamic> takeUserProfileImage(ImageSource source) async {
      // ignore: invalid_use_of_visible_for_testing_member
      var image = await ImagePicker.platform.pickImage(source: source);
      late PickedFile imagePickedFile;
      setState(() {
        imagePickedFile = image as PickedFile;
        userProfileImagePath = imagePickedFile.path;
        checkUserProfileImagePath = false;
      });
      print(userProfileImagePath);
    }

    Future bottomSheet() {
      return showModalBottomSheet(
        builder: (BuildContext context) => Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
                icon: const Icon(Icons.camera),
                onPressed: () async {
                  takeUserProfileImage(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                ),
                icon: const Icon(Icons.image),
                onPressed: () {
                  takeUserProfileImage(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          ),
        ),
        context: context,
      );
    }

    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Theme.of(context).primaryColor),
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Update'),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Edit Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Center(
            child: Column(children: [
              if (checkUserProfileImagePath)
                SvgPicture.asset(
                  'icons/profile-circle.svg',
                  width: width / 4,
                  height: width / 4,
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipOval(
                      child: Image.file(
                    File(userProfileImagePath),
                    width: width / 3,
                    height: width / 3,
                    fit: BoxFit.fill,
                  )),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (() => bottomSheet()),
                  child: Text(
                    'Change Profile Picture',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor),
                  ),
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
                    children: [
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
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                    children: [
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
                            onChanged: (value) {
                              setState(() {
                                phone = value;
                              });
                            },
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                    children: [
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
                            onChanged: (value) {
                              setState(() {
                                email = value;
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
