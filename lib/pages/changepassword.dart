import 'package:bitbybit/colorcode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              color: Color(0xFF624aa1),
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FontAwesomeIcons.arrowLeftLong,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Text(
              'Change Password',
              style: GoogleFonts.poppins(
                  fontSize: 21, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                // Keyboard type declaration for @ button on keyboard.
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                // Text Controller for email.
                controller: _passwordField, obscureText: true,
                decoration: InputDecoration(
                    // Label on Email input Dialog Box
                    labelText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          20,
                         20,
                         20),
                      child: Icon(
                        // Suffix logo for mail.
                        FontAwesomeIcons.lockOpen,
                        size: 18,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter new Password",
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: AppUIColor.appLightColor),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: AppUIColor.appLightColor),
                        gapPadding: 10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                      backgroundColor: AppUIColor.appLightColor),
                  onPressed: () async {
                    await FirebaseAuth.instance.currentUser!
                        .updatePassword(_passwordField.text);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.white,
                        content: Center(
                          child: Container(
                            color: Colors.transparent,
                            // height: 500,
                            // width: 500,
                            child: Center(
                                child: Text(
                              'Password Updated',
                              style: TextStyle(color: Colors.black),
                            )),
                          ),
                        )));
                  },
                  child: Text(
                    "Update Password",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
