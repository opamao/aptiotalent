import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../themes/themes.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final List<String> _selectedGenders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Quel est votre modèle de travail?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Gap(3.h),
                _buildCheckboxOption("Sur place"),
                Gap(1.h),
                _buildCheckboxOption("Hybride"),
                Gap(1.h),
                _buildCheckboxOption("À distance"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxOption(String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _selectedGenders.contains(value)
              ? appColor
              : appColor.withOpacity(.2),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: CheckboxListTile(
        value: _selectedGenders.contains(value),
        // Vérifie si l'option est sélectionnée
        onChanged: (isChecked) {
          setState(() {
            if (isChecked!) {
              _selectedGenders.add(value); // Ajoute l'option sélectionnée
            } else {
              _selectedGenders.remove(value); // Retire l'option décochée
            }
          });
          print("Selected Genders: $_selectedGenders");
        },
        title: Text(value),
        contentPadding: EdgeInsets.zero,
        activeColor: appColor,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
