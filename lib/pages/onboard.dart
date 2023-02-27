import 'package:bitbybit/colorcode.dart';
import 'package:bitbybit/pages/login.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUIColor.lightbackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                        path: demo_data[index].path,
                        title: demo_data[index].title,
                        descr: demo_data[index].descr,
                      )),
            ),
            Row(
              children: [
                ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: dotindicator(
                            isActive: index == _pageIndex,
                          ),
                        )),
                Spacer(),
                Container(
                  height: (_pageIndex == 2) ? 50 : 60,
                  width: (_pageIndex == 2) ? 100 : 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                      if (_pageIndex == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: (_pageIndex == 2)
                            ? RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))
                            : CircleBorder(),
                        backgroundColor: AppUIColor.appLightColor),
                    child: (_pageIndex == 2)
                        ? Row(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Icon(Icons.login)
                            ],
                          )
                        : Center(child: Icon(Icons.arrow_right_alt_outlined)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

class dotindicator extends StatelessWidget {
  dotindicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? AppUIColor.appLightColor
              : AppUIColor.appLightColor.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class onBoard {
  final String path, title, descr;
  onBoard(this.path, this.title, this.descr);
}

final List<onBoard> demo_data = [
  onBoard('assets/images/onboard1.png', "Learn coding with consistency",
      'Be a consistent learner and achieve your goals everyday'),
  onBoard('assets/images/onboard2.png', "Don't stay behind",
      'Learn the latest and important topics without missing out.'),
  onBoard('assets/images/onboard3.png', "Learn what you love",
      'Choose from the variety of languages to learn.'),
];

class OnboardContent extends StatelessWidget {
  OnboardContent({
    Key? key,
    required this.path,
    required this.title,
    required this.descr,
  }) : super(key: key);
  final String path, title, descr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          path,
          height: 250,
        ),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w500, color: AppUIColor.appLightColor),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          descr,
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    );
  }
}
