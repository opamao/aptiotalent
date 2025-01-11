import 'package:aptiotalent/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/widgets.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final List<String> _skills = [];

  var cle = TextEditingController();

  void _addSkill() {
    if (cle.text.isNotEmpty) {
      setState(() {
        _skills.add(cle.text);
        cle.clear();
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      _skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Compétences clés"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputText(
                hintText: "Saisissez votre compétence",
                onSubmitted: (value) => _addSkill(),
                keyboardType: TextInputType.text,
                controller: cle,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onPressed: _addSkill,
                ),
                validatorMessage: "Veuillez saisir au moins une compétence",
              ),
              Text(
                "Appuyez sur + pour ajouter une compétence "
                "après avoir saisir. Ex: CSS -> +",
                style: TextStyle(
                  color: appColorBlue,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 14.sp,
                ),
              ),
              Gap(2.h),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _skills
                    .map(
                      (skill) => Chip(
                        label: Text(skill),
                        deleteIcon: Icon(
                          Icons.close,
                          color: appColor,
                        ),
                        onDeleted: () => _removeSkill(skill),
                      ),
                    )
                    .toList(),
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
}
