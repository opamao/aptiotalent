import 'package:aptiotalent/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/widgets.dart';
import '../../auths/login/login.dart';
import '../../menus/menus.dart';

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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circular background
                    Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withValues(alpha:0.1),
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 120,
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: appColor.withValues(alpha:.2),
                      ),
                    ),
                    // Tags
                    Positioned(
                      top: 50,
                      left: 30,
                      child: _buildTag("#Designer", Colors.purple),
                    ),
                    Positioned(
                      bottom: 120,
                      right: 30,
                      child: _buildTag("#Manager", appColor),
                    ),
                    Positioned(
                      top: 130,
                      left: 70,
                      child: _buildTag("#Consultance", Colors.blue),
                    ),
                    Positioned(
                      bottom: 80,
                      left: 20,
                      child: _buildTag("#Developer", Colors.orange),
                    ),
                    Positioned(
                      top: 100,
                      right: 40,
                      child: _buildTag("#Finance", Colors.green),
                    ),
                  ],
                ),
              ),
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
                    titre: demoData[index].titre,
                    subTitre: demoData[index].subTitre,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'avant',
                    shape: CircleBorder(),
                    onPressed: () {
                      if (_pageIndex == 0) {
                        return;
                      }
                      _pageController.previousPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    child: Icon(
                      Icons.navigate_before_outlined,
                      color: appColor,
                      size: 20.sp,
                    ),
                  ),
                  Spacer(),
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton.small(
                    heroTag: 'next',
                    shape: CircleBorder(),
                    onPressed: () {
                      if (_pageIndex + 1 == _nbreSlides) {
                        return;
                      }
                      _pageController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    child: Icon(
                      Icons.navigate_next_outlined,
                      color: appColor,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
              Gap(3.h),
              SubmitButton(
                AppConstants.btnNext,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuPage(),
                    ),
                  );
                },
              ),
              Gap(1.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Avez-vous déjà un compte? Connexion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

class TestScreenContent extends StatelessWidget {
  const TestScreenContent({
    super.key,
    required this.titre,
    required this.subTitre,
  });

  final String titre, subTitre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titre,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appBlack,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            Gap(2.w),
            Text(
              subTitre,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appBlack,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboard {
  final String titre, subTitre;

  Onboard({
    required this.titre,
    required this.subTitre,
  });
}

final List<Onboard> demoData = [
  Onboard(
    titre: "Trouver votre parfait, le cheminement de carrière commence ici !",
    subTitre: "Confus à la recherche d'emplois mis à jour et voyons ici beaucoup d'offres d'emploi",
  ),
  Onboard(
    titre: "Trouver votre parfait, le cheminement de carrière commence ici !",
    subTitre: "Confus à la recherche d'emplois mis à jour et voyons ici beaucoup d'offres d'emploi",
  ),
  Onboard(
    titre: "Trouver votre parfait, le cheminement de carrière commence ici !",
    subTitre: "Confus à la recherche d'emplois mis à jour et voyons ici beaucoup d'offres d'emploi",
  ),
  Onboard(
    titre: "Trouver votre parfait, le cheminement de carrière commence ici !",
    subTitre: "Confus à la recherche d'emplois mis à jour et voyons ici beaucoup d'offres d'emploi",
  ),
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
        color: isActive ? appColor : appColor.withValues(alpha:.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
