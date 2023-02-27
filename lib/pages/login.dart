import 'package:bitbybit/colorcode.dart';
import 'package:bitbybit/pages/home.dart';
import 'package:bitbybit/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage('assets/images/loginbg.png'),
            //     fit: BoxFit.fill)
            ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bitbybitlogo.jpg',
                  height: 53,
                  width: 53,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                      fontSize: 19,
                      color: AppUIColor.appLightColor,
                      fontWeight: FontWeight.w600),
                ),
                Text('Login to continue',
                    style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: AppUIColor.appLightColor,
                        fontWeight: FontWeight.normal)),
                SizedBox(
                  height: 50,
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
                  height: 17,
                ),
                Center(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppUIColor.appLightColor),
                      borderRadius: BorderRadius.circular(12)),
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
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
                  height: 17,
                ),
                Center(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppUIColor.appLightColor),
                      borderRadius: BorderRadius.circular(12)),
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
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
                  height: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: AppUIColor.appLightColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppUIColor.appLightColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'LOG IN',
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
                        MaterialPageRoute(builder: (Context) => SignUpPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: AppUIColor.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Sign up now',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: AppUIColor.appLightColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
