import 'package:auto_size_text/auto_size_text.dart';
import 'package:bitbybit/pages/onboard.dart';
import 'package:bitbybit/pages/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colorcode.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              width: double.infinity,
              color: AppUIColor.appLightColor,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: CachedNetworkImage(
                        // height: 150,
                        imageUrl: (FirebaseAuth.instance.currentUser!.photoURL)
                            .toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 80.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          color: AppUIColor.appLightColor,
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 80.0,
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
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            (FirebaseAuth.instance.currentUser!.displayName)
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: AppUIColor.lightbackgroundColor),
                          ),
                          AutoSizeText(
                            (FirebaseAuth.instance.currentUser!.email)
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: AppUIColor.lightbackgroundColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              child: Column(children: [
                Container(
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
                              // width: 250,
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
                      ],
                    )),
                SizedBox(
                  height: 31,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.user),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "ABOUT US",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: AppUIColor.lightTextColor),
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 31,
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OnBoarding()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppUIColor.appLightColor,
                          borderRadius: BorderRadius.circular(14)),
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: AppUIColor.lightbackgroundColor,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  "LOG OUT",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: AppUIColor.lightbackgroundColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
