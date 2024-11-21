import 'package:aptiotalent/src/themes/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../auths/login/login.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    checkLogin();
    _pageController = PageController(initialPage: 0);
    _nbreSlides = demoData.length;
    super.initState();
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? role = pref.getString("role");
    if (role != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Container(),
        ),
        (route) => false,
      );
    }
  }

  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _pageIndex = 0;
  late int _nbreSlides;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => TestScreenContent(
                    image: demoData[index].image,
                    titre: demoData[index].titre,
                    subTitre: demoData[index].subTitre,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton.small(
                    onPressed: () {
                      if (_pageIndex + 1 == _nbreSlides) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                        return;
                      }
                      _pageController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.navigate_next,
                      color: Colors.black87,
                      size: 20.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestScreenContent extends StatelessWidget {
  const TestScreenContent({
    super.key,
    required this.image,
    required this.titre,
    required this.subTitre,
  });

  final String image, titre, subTitre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 40, right: 55),
              child: Image.asset(
                image,
              ),
            ),
            const Spacer(),
            Text(
              titre,
              style: TextStyle(
                color: appBlack,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              subTitre,
              style: TextStyle(
                color: appBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Onboard {
  final String image, titre, subTitre;

  Onboard({
    required this.image,
    required this.titre,
    required this.subTitre,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: "assets/images/dons.png",
    titre: "Dons",
    subTitre: "Faites un geste pour encourager votre joueur",
  ),
  Onboard(
    image: "assets/images/vote.png",
    titre: "Voter",
    subTitre: "Votez pour faire gagner votre meilleur joueur du match",
  ),
  Onboard(
    image: "assets/images/reco.png",
    titre: "Récompenses",
    subTitre: "Vous pouvez gagner des lots en étant des participants",
  )
];

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isActive ? 3.w : 2.w,
      width: 3.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
