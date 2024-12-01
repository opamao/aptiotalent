import 'package:aptiotalent/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/constants.dart';
import '../../../../widgets/widgets.dart';
import '../register.dart';

class NextOnePage extends StatefulWidget {
  const NextOnePage({super.key});

  @override
  State<NextOnePage> createState() => _NextOnePageState();
}

class _NextOnePageState extends State<NextOnePage> {
  var pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Indicateurs circulaires
            Container(
              color: appColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    pages.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: currentIndex == index
                                ? Colors.transparent
                                : Colors.grey.shade400,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: currentIndex == index
                              ? Colors.white
                              : Colors.transparent,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: currentIndex == index
                                  ? appColor
                                  : Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Contenu des pages
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      appColor,
                      appWhite,
                    ],
                    stops: [
                      0.1,
                      0.3,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: pages[currentIndex],
                ),
              ),
            ),

            // Boutons "Précédent" et "Suivant"
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    backgroundColor: appColor,
                    onPressed: () {
                      if (currentIndex > 0) {
                        setState(() {
                          currentIndex--;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: appWhite,
                    ),
                  ),
                  Gap(2.w),
                  Expanded(
                    child: SubmitButton(
                      currentIndex == pages.length - 1
                          ? AppConstants.btnValid
                          : AppConstants.btnSetup,
                      onPressed: () async {
                        if (currentIndex < pages.length - 1) {
                          setState(() {
                            currentIndex++;
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PositionPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Gap(2.h),
          ],
        ),
      ),
    );
  }
}
