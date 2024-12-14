import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../themes/themes.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
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
                  "Quel poste cherchez-vous à obtenir?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Gap(3.h),
                _buildCheckboxOption("Developpeur mobile"),
                Gap(1.h),
                _buildCheckboxOption("Project manager"),
                Gap(1.h),
                _buildCheckboxOption("Analyse de données"),
                Gap(1.h),
                _buildCheckboxOption("Commercial"),
                Gap(1.h),
                _buildCheckboxOption("Graphique design"),
                Gap(1.h),
                _buildCheckboxOption("It Support"),
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
