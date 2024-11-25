import 'package:aptiotalent/constants/constants.dart';
import 'package:aptiotalent/src/features/splash/spalsh.dart';
import 'package:aptiotalent/src/themes/themes.dart';
import 'package:aptiotalent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColor),
        textTheme: GoogleFonts.josefinSansTextTheme(),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  });
  }
}