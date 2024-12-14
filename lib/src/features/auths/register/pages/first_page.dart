import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../themes/themes.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<String> _selectedGenders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              Text(
                "Quel type d'emploi recherchez-vous?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              Gap(3.h),
              _buildCheckboxOption("Temps plein"),
              Gap(1.h),
              _buildCheckboxOption("À temps partiel"),
              Gap(1.h),
              _buildCheckboxOption("Travail à domicile"),
              Gap(1.h),
              _buildCheckboxOption("Sur demande"),
            ],
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
              : appColor.withValues(alpha:.2),
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
