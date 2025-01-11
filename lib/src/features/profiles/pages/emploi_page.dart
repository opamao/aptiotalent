import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class EmploiPage extends StatefulWidget {
  const EmploiPage({super.key});

  @override
  State<EmploiPage> createState() => _EmploiPageState();
}

class _EmploiPageState extends State<EmploiPage> {
  final _formKeyJob = GlobalKey<FormState>();

  late int? _value = 1;
  late int? _valueType = 1;
  late int? _valuePeriod = 1;

  var company = TextEditingController();
  var date = TextEditingController();
  var year = TextEditingController();
  var month = TextEditingController();
  var amount = TextEditingController();
  var title = TextEditingController();

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
          key: _formKeyJob,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("S'agit-il de votre entreprise actuelle ?"),
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
                  Text("Type d'emploi"),
                  Wrap(
                    spacing: 5,
                    children: [
                      ChoiceChip(
                        label: Text(
                          "Temps plein",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valueType == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _valueType = selected ? 1 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "Temps partiel",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valueType == 2,
                        onSelected: (bool selected) {
                          setState(() {
                            _valueType = selected ? 2 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "Stage",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valueType == 3,
                        onSelected: (bool selected) {
                          setState(() {
                            _valueType = selected ? 3 : null;
                          });
                        },
                      ),
                    ],
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Titre de poste",
                    keyboardType: TextInputType.text,
                    controller: title,
                    validatorMessage: "Dev mobile Flutter & Dart",
                  ),
                  Gap(1.h),
                  Text("Expérience"),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: year,
                          validatorMessage: "Pas d'année : 0",
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text("An"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: month,
                          validatorMessage: "Pas de mois : 0",
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 15.0),
                            child: Text("Mois"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: " Nom entreprise",
                    keyboardType: TextInputType.number,
                    controller: company,
                    validatorMessage: "Pas de mois : 0",
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
                      child: Icon(Icons.home_work_outlined),
                    ),
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Date d'entrée en fonction",
                    keyboardType: TextInputType.text,
                    controller: date,
                    validatorMessage: "12/12/2015",
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: " Salaire annuel",
                    keyboardType: TextInputType.number,
                    controller: amount,
                    validatorMessage: "Pas de mois : 0",
                    prefixIcon: Container(
                      padding:
                          EdgeInsets.only(left: 8.0, top: 15.0, right: 8.0),
                      margin: EdgeInsets.only(left: 2.w),
                      decoration: BoxDecoration(
                        color: appWhite,
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Text("XOF"),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("Par an"),
                    ),
                  ),
                  Gap(1.h),
                  Text("Délais de préavis"),
                  Wrap(
                    spacing: 5,
                    children: [
                      ChoiceChip(
                        label: Text(
                          "Immédiat",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valuePeriod == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _valuePeriod = selected ? 1 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "7-15 Jours",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valuePeriod == 2,
                        onSelected: (bool selected) {
                          setState(() {
                            _valuePeriod = selected ? 2 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "1 Mois",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valuePeriod == 3,
                        onSelected: (bool selected) {
                          setState(() {
                            _valuePeriod = selected ? 3 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "2 Mois",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valuePeriod == 4,
                        onSelected: (bool selected) {
                          setState(() {
                            _valuePeriod = selected ? 4 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "3 Mois",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valuePeriod == 5,
                        onSelected: (bool selected) {
                          setState(() {
                            _valuePeriod = selected ? 5 : null;
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text(
                          "Autres",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        selected: _valuePeriod == 6,
                        onSelected: (bool selected) {
                          setState(() {
                            _valuePeriod = selected ? 6 : null;
                          });
                        },
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
            if (_formKeyJob.currentState!.validate()) {
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }
}
