import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../themes/themes.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
                  "Quel est votre niveau d'expérience actuel?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Gap(3.h),
                _buildCheckboxOption("Stage"),
                Gap(1.h),
                _buildCheckboxOption("Débutant"),
                Gap(1.h),
                _buildCheckboxOption("Associé"),
                Gap(1.h),
                _buildCheckboxOption("Junior"),
                Gap(1.h),
                _buildCheckboxOption("Sénior"),
                Gap(1.h),
                _buildCheckboxOption("Directeur"),
                Gap(1.h),
                _buildCheckboxOption("Cadre"),
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
