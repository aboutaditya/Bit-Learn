import 'package:bitbybit/colorcode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      // drawerEnableOpenDragGesture: false,
      backgroundColor: AppUIColor.lightbackgroundColor,
      appBar: AppBar(
        actions: [
          Container(
            // height: 500,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Icon(
                      FontAwesomeIcons.barsStaggered,
                      color: AppUIColor.appLightColor,
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
                    color: AppUIColor.appLightColor,
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
          style: TextStyle(
              color: AppUIColor.appLightColor,
              fontSize: 26,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
    );
  }
}
