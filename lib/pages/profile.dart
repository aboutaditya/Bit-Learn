import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bitbybit/pages/changepassword.dart';
import 'package:bitbybit/pages/home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../colorcode.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  updateProfile() {
    setState(() {
      profilePic = (FirebaseAuth.instance.currentUser!.photoURL).toString();
    });
  }

  // Pick an image
  String profilePic = (FirebaseAuth.instance.currentUser!.photoURL).toString();
  imagePick() async {
    File photo;
    // final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      photo = File(
        pickedFile.path,
      );
      // return CircularProgressIndicator();
      final ref = FirebaseStorage.instance
          .ref('User')
          .child((FirebaseAuth.instance.currentUser!.email).toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )));
      await ref.putFile(photo);
      String photLink = await ref.getDownloadURL();
      FirebaseAuth.instance.currentUser!.updatePhotoURL(photLink);
      // await updateProfile();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Center(
            child: Container(
              color: Colors.transparent,
              // height: 500,
              // width: 500,
              child: Center(
                  child: Text(
                'Profile Picture Updated',
                style: TextStyle(color: Colors.black),
              )),
            ),
          )));
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppUIColor.lightbackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: AppUIColor.appLightColor,
                        height: 150,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppUIColor.lightbackgroundColor,
                                  size: 31,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppUIColor.lightbackgroundColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(60),
                                topLeft: Radius.circular(60))),
                        height: 150,
                        width: double.infinity,
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              height: 150,
                              imageUrl: profilePic,
                              // (FirebaseAuth.instance.currentUser!.photoURL)
                              //     .toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 130.0,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: AppUIColor.appLightColor,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 130.0,
                                height: 130.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await imagePick();

                              setState(() {
                                profilePic = (FirebaseAuth
                                        .instance.currentUser!.photoURL)
                                    .toString();
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Text(
                              'Change Profile Picture',
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  color: AppUIColor.appLightColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Name',
                            style: GoogleFonts.poppins(
                                fontSize: 22, color: AppUIColor.lightTextColor),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppUIColor.appLightColor)),
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 17, top: 8, right: 8, bottom: 8),
                        child: AutoSizeText(
                          (FirebaseAuth.instance.currentUser!.displayName)
                              .toString(),
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: AppUIColor.lightTextColor),
                        ),
                      )),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail,
                            size: 22,
                            color: AppUIColor.lightTextColor,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Email',
                            style: GoogleFonts.poppins(
                                fontSize: 22, color: AppUIColor.lightTextColor),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppUIColor.appLightColor)),
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 17, top: 8, right: 8, bottom: 8),
                        child: AutoSizeText(
                          (FirebaseAuth.instance.currentUser!.email).toString(),
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: AppUIColor.lightTextColor),
                        ),
                      )),
                  SizedBox(
                    height: 22,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordChangePage()));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.userLock),
                                SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  width: 250,
                                  child: AutoSizeText(
                                    "CHANGE PASSWORD",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: AppUIColor.lightTextColor),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              FontAwesomeIcons.arrowRight,
                              size: 22,
                            )
                          ],
                        )),
                  ),
                  // SizedBox(
                  //   height: 31,
                  // ),
                  // Container(
                  //     width: MediaQuery.of(context).size.width * 0.88,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Icon(FontAwesomeIcons.user),
                  //             SizedBox(
                  //               width: 8,
                  //             ),
                  //             Text(
                  //               "ABOUT US",
                  //               style: GoogleFonts.poppins(
                  //                   fontWeight: FontWeight.w500,
                  //                   fontSize: 22,
                  //                   color: AppUIColor.lightTextColor),
                  //             ),
                  //           ],
                  //         ),
                  //         Icon(
                  //           FontAwesomeIcons.arrowRight,
                  //           size: 22,
                  //         )
                  //       ],
                  //     )),
                  SizedBox(
                    height: 31,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "LOG OUT",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: AppUIColor.lightTextColor),
                                ),
                              ],
                            ),
                            Icon(
                              FontAwesomeIcons.arrowRight,
                              size: 22,
                            )
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
