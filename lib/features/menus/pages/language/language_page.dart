import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = "Français";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Langues"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRadioOption(
                    "Français",
                    "assets/images/france.png",
                  ),
                  _buildRadioOption(
                    "Anglais",
                    "assets/images/english.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          AppConstants.btnSave,
          onPressed: () async {},
        ),
      ),
    );
  }

  Widget _buildRadioOption(String language, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _selectedLanguage.contains(language)
              ? appColor
              : appColor.withValues(alpha: .2),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedLanguage = language;
          });
        },
        child: Row(
          children: [
            SizedBox(width: 2.w),
            Image.asset(
              imagePath,
              width: 10.w,
              height: 10.w,
            ),
            Gap(2.w),
            Text(
              language,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Radio<String>(
              focusColor: appColor,
              activeColor: appColor,
              value: language,
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
