import 'package:auto_size_text/auto_size_text.dart';
import 'package:bitbybit/colorcode.dart';
import 'package:bitbybit/pages/blogs.dart';
import 'package:bitbybit/pages/coursedata.dart';
import 'package:bitbybit/pages/drawerpage.dart';
import 'package:bitbybit/pages/mycourses.dart';
import 'package:bitbybit/pages/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   int selectedPage = 0;

//   // String fname = fullName[0].toString();

//   final List<Widget> _pages = [
//     HomePage(),
//     CoursesPage(),
//     blogPage(),
//     ProfilePage()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[selectedPage],
//       bottomNavigationBar: Container(
//         color: AppUIColor.lightbackgroundColor,
//         child: Padding(
//           padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
//           child: GNav(
//               backgroundColor: AppUIColor.lightbackgroundColor,
//               onTabChange: (index) {
//                 setState(() {
//                   selectedPage = index;
//                 });
//               },
//               padding: EdgeInsets.all(17),
//               tabActiveBorder: Border.all(color: AppUIColor.lightTextColor),
//               gap: 8,
//               tabs: [
//                 GButton(
//                   icon: FontAwesomeIcons.house,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: FontAwesomeIcons.circlePlay,
//                   text: 'My Courses',
//                 ),
//                 GButton(
//                   icon: FontAwesomeIcons.bookOpen,
//                   text: 'Blogs',
//                 ),
//                 GButton(
//                   icon: FontAwesomeIcons.addressCard,
//                   text: 'Profile',
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> getDataStream() {
      return FirebaseFirestore.instance.collection('Languages').orderBy('rank').snapshots();
    }

    var fullName =
        FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0];
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      drawer: MyDrawer(),
      backgroundColor: AppUIColor.lightbackgroundColor,
      appBar: AppBar(
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppUIColor.lightbackgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: (FirebaseAuth.instance.currentUser!.photoURL)
                            .toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          width: 44.0,
                          height: 44.0,
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
                          width: 44.0,
                          height: 44.0,
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
                  ),
                  Text(
                    'BIT LEARN',
                    style: GoogleFonts.montserrat(
                        color: AppUIColor.appLightColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    FontAwesomeIcons.bell,
                    color: AppUIColor.lightbackgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: AppUIColor.lightbackgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'BitLearn',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          "Welcome,  ",
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          fullName,
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      "What would you like to learn?",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: AppUIColor.appLightColor,
                    borderRadius: BorderRadius.circular(17),
                    image: DecorationImage(
                        image: AssetImage('assets/images/homeimage.png'),
                        opacity: 0.5,
                        fit: BoxFit.fill)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: AutoSizeText(
                      'LEARN \nEVERYTHING \nBIT BY BIT',
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 35,
                          wordSpacing: 5,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      'COURSES',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w900,
                          fontSize: 26,
                          color: AppUIColor.appLightColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: getDataStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: documents.length,
                            itemBuilder: (context, index) {
                              return coursedata(
                                  enrollNo: documents[index]['enroll'],
                                  langIcon: documents[index]['image'],
                                  langName: documents[index]['name']);
                            });
                      },
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     coursedata(
              //       langName: 'Python',
              //       langIcon: "FontAwesomeIcons.python",
              //       enrollNo: '500+ enrolled',
              //     ),
              //     coursedata(
              //       langName: 'Java',
              //       langIcon: "FontAwesomeIcons.java",
              //       enrollNo: '500+ enrolled',
              //     ),
              //     coursedata(
              //       langName: 'JavaScript',
              //       langIcon: "FontAwesomeIcons.js",
              //       enrollNo: '500+ enrolled',
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class coursedata extends StatelessWidget {
  coursedata(
      {super.key,
      required this.enrollNo,
      required this.langIcon,
      required this.langName});
  String langIcon;
  String langName, enrollNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22,left: 17,right: 17),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseData(
                        langName: langName,
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Image.network(langIcon,height: MediaQuery.of(context).size.height/15,width: MediaQuery.of(context).size.width/8,)),
              ),
              // SizedBox(width: 31,),
              Container(width: MediaQuery.of(context).size.width/3,
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        langName,
                        style: GoogleFonts.poppins(
                            color: AppUIColor.lightTextColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 26),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.userGroup,
                            color: AppUIColor.appLightColor,
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Text(
                            enrollNo+' ENROLLED',
                            style: GoogleFonts.poppins(
                                color: AppUIColor.appLightColor, fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseData(
                                langName: langName,
                              )));
                },
                child: Icon(
                  FontAwesomeIcons.arrowRight,
                  size: 31,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
