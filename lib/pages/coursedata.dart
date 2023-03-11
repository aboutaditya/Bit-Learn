import 'package:bitbybit/colorcode.dart';
import 'package:bitbybit/pages/courselearn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseData extends StatelessWidget {
  CourseData({super.key, required this.langName});
  String langName;
  Stream<QuerySnapshot> getDataStream() {
    return FirebaseFirestore.instance.collection(langName).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUIColor.lightbackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppUIColor.lightbackgroundColor,
        title: Text(
          langName,
          style: GoogleFonts.dmSans(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: AppUIColor.lightTextColor),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                      child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.width * (0.53),
                      // width: MediaQuery.of(context).size.width * (0.9),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/homeimage.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width * (0.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   langName,
                        //   style: GoogleFonts.dmSans(
                        //       fontSize: 34,
                        //       fontWeight: FontWeight.w800,
                        //       color: AppUIColor.lightTextColor),
                        // ),
                        // SizedBox(
                        //   height: 17,
                        // ),
                        Text(
                          'Everything you need to know about $langName',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 22, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        StreamBuilder(
                          stream: getDataStream(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: documents.length,
                                itemBuilder: (context, index) {
                                  return courseItems(
                                      detail: documents[index]['detail'],
                                      image: documents[index]['image'],
                                      link: documents[index]['link'],
                                      title: documents[index]['title'],
                                      language: 'Python',
                                      sno: documents[index]['sno']);
                                });
                          },
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                            color: AppUIColor.appLightColor,
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                            child: Text(
                          'Enroll Course',
                          style: GoogleFonts.poppins(
                              color: AppUIColor.lightbackgroundColor,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )),
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

class courseItems extends StatelessWidget {
  courseItems(
      {super.key,
      required this.detail,
      required this.image,
      required this.link,
      required this.title,
      required this.language,
      required this.sno});
  String title, image, detail, link, language, sno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseContentPage(
                        language: language,
                        title: title,
                        image: image,
                        link: link,
                        detail: detail,
                      )));
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: AppUIColor.appLightColor)),
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Text(
                        sno,
                        style: TextStyle(
                            fontSize: 18, color: AppUIColor.appLightColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                            fontSize: 23, color: AppUIColor.lightTextColor),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseContentPage(
                                language: language,
                                title: title,
                                image: image,
                                link: link,
                                detail: detail,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 13),
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 36,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
