import 'package:bitbybit/pages/home.dart';
import 'package:bitbybit/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colorcode.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Image.asset(
                    'assets/images/bitbybitlogo.jpg',
                    height: 53,
                    width: 53,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Create an account',
                    style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: AppUIColor.appLightColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text('Name',
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: AppUIColor.appLightColor,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppUIColor.appLightColor),
                        borderRadius: BorderRadius.circular(12)),
                    height: 53,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            controller: name,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              hintText: 'Your name ',
                              hintStyle: GoogleFonts.lato(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          )),
                    ),
                  )),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text('Email Address',
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: AppUIColor.appLightColor,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppUIColor.appLightColor),
                        borderRadius: BorderRadius.circular(12)),
                    height: 53,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: email,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                hintText: 'abcdefghi@email.com',
                                hintStyle: GoogleFonts.lato(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.mail_outline_outlined,
                                  size: 31,
                                  color: AppUIColor.appLightColor,
                                )),
                          )),
                    ),
                  )),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text('Password',
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: AppUIColor.appLightColor,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppUIColor.appLightColor),
                        borderRadius: BorderRadius.circular(12)),
                    height: 53,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                hintText: '***********',
                                hintStyle: GoogleFonts.lato(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  size: 31,
                                  color: AppUIColor.appLightColor,
                                )),
                          )),
                    ),
                  )),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Text('Confirm Password',
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: AppUIColor.appLightColor,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Center(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppUIColor.appLightColor),
                        borderRadius: BorderRadius.circular(12)),
                    height: 53,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: passwordconfirm,
                            obscureText: true,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                hintText: '***********',
                                hintStyle: GoogleFonts.lato(color: Colors.grey),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  size: 31,
                                  color: AppUIColor.appLightColor,
                                )),
                          )),
                    ),
                  )),
                  SizedBox(
                    height: 22,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (password.text == passwordconfirm.text) {
                        signup(email.text, password.text, name.text, context);
                      } else {
                        print("mismacth");
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 53,
                      decoration: BoxDecoration(
                          color: AppUIColor.appLightColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (Context) => LoginPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account already?",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: AppUIColor.lightTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Log in',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: AppUIColor.appLightColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

void signup(String emailAddress, String password, String name, context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    final updatename =
        await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The password provided is too weak.')));
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The account already exists for that email.')));
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
