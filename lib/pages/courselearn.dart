import 'package:bitbybit/colorcode.dart';
import 'package:bitbybit/pages/codeweb.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseContentPage extends StatelessWidget {
  CourseContentPage(
      {super.key,
      required this.detail,
      required this.image,
      required this.link,
      required this.title,
      required this.language});
  String title, image, detail, link, language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppUIColor.lightbackgroundColor,
      appBar: AppBar(
        backgroundColor: AppUIColor.lightbackgroundColor,
        elevation: 0,
        actions: [
          Container(color: AppUIColor.lightbackgroundColor,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: AppUIColor.lightTextColor,
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 4,
                    // ),
                    Text(
                      language,
                      style: GoogleFonts.poppins(
                          color: AppUIColor.lightTextColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyWebView(link),
                              ));
                        },
                        child: Icon(
                          FontAwesomeIcons.code,
                          color: AppUIColor.lightTextColor,
                        ))
                    // Text('hello')
                  ]),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        color: AppUIColor.lightTextColor,
                        fontSize: 44,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      detail,
                      style: GoogleFonts.poppins(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 13,left: 13,right: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        // decoration: BoxDecoration(
                        //     color: AppUIColor.appLightColor,
                        //     borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            decoration: BoxDecoration(
                                color: AppUIColor.appLightColor,
                                borderRadius: BorderRadius.circular(13)),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Continue',
                                        style: GoogleFonts.poppins(
                                            color:
                                                AppUIColor.lightbackgroundColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.arrowRight,
                                      color: AppUIColor.lightbackgroundColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
