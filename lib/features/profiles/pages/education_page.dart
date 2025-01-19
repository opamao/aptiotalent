import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final _formKeyEducation = GlobalKey<FormState>();

  late int? _value = 0;

  var school = TextEditingController();
  var formation = TextEditingController();
  var yearOne = TextEditingController();
  var yearTwo = TextEditingController();
  var monthOne = TextEditingController();
  var monthTwo = TextEditingController();

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Emploi"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKeyEducation,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Continuez-vous à étudier?"),
                  Wrap(
                    spacing: 5,
                    children: [
                      ChoiceChip(
                        label: Text(
                          "Oui",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _value == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? 1 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "Non",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _value == 2,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? 2 : null;
                          });
                        },
                      ),
                    ],
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: " Nom établissement",
                    keyboardType: TextInputType.number,
                    controller: school,
                    validatorMessage: "Veuillez saisir le nom de l'établissement",
                    prefixIcon: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      margin: EdgeInsets.only(left: 2.w),
                      decoration: BoxDecoration(
                        color: appWhite,
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Icon(Icons.school_outlined),
                    ),
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Titre de la formation",
                    keyboardType: TextInputType.number,
                    controller: school,
                    validatorMessage: "Veuillez saisir le titre de la formation",
                  ),
                  Gap(1.h),
                  Text("Début de la formation"),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: monthOne,
                          validatorMessage: "Pas de mois : 0",
                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 8.0, top: 15.0),
                            child: Text("Mois"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: yearOne,
                          validatorMessage: "Pas d'année : 0",
                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text("An"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(1.h),
                  Text("Fin de la formation"),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: monthTwo,
                          validatorMessage: "Pas de mois : 0",
                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 8.0, top: 15.0),
                            child: Text("Mois"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: yearTwo,
                          validatorMessage: "Pas d'année : 0",
                          suffixIcon: Padding(
                            padding:
                            const EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text("An"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          AppConstants.btnSave,
          onPressed: () async {
            if (_formKeyEducation.currentState!.validate()) {
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }
}
