import 'package:aptiotalent/src/themes/themes/themes.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../utils/utilis.dart';
import '../../intro/intro.dart';
import '../../menus/menus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double loadingValue = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _updateLoadingProgress();
    });
  }

  _updateLoadingProgress() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (loadingValue >= 1) {
        _navigateToNextScreen();
        return;
      }
      loadingValue += 0.1;
      setState(() {});
      _updateLoadingProgress();
    });
  }

  Future<void> _navigateToNextScreen() async {
    final SharedPreferencesHelper prefsHelper = SharedPreferencesHelper();
    String? val = prefsHelper.getString("identifiant");
    if (val != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MenuPage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const IntroPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(167.5),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    AppConstants.appName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appWhite,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(167.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
