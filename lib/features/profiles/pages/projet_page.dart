import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';

class ProjetPage extends StatefulWidget {
  const ProjetPage({super.key});

  @override
  State<ProjetPage> createState() => _ProjetPageState();
}

const List<String> role = <String>[
  "FrontEnd developpeur",
  'UX/UI Design',
  'Full Stack developpeur',
  'PHP developpeur',
  'Flutter developpeur',
];

class _ProjetPageState extends State<ProjetPage> {
  final _formKeyProject = GlobalKey<FormState>();

  var lien = TextEditingController();
  var description = TextEditingController();
  var titre = TextEditingController();
  var year = TextEditingController();
  var month = TextEditingController();

  final _snackBar = const SnackBar(
    content: Text("Veuillez vérifier les champs qui sont obligatoires"),
    backgroundColor: Colors.red,
  );

  String? _selectedValue;
  bool _isFocus = false;

  bool light = false;

  static WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(
        Icons.check,
        color: appWhite,
      ),
      WidgetState.any: Icon(Icons.close),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Projets"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKeyProject,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                    hintText: "Titre projet",
                    keyboardType: TextInputType.text,
                    controller: titre,
                    validatorMessage: "Veuillez saisir le titre du projet",
                  ),
                  Gap(1.h),
                  Focus(
                    onFocusChange: (focus) {
                      setState(() {
                        _isFocus = focus;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 4.w),
                      decoration: BoxDecoration(
                        color: appColor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(3.w),
                        border: Border.all(
                          color: _isFocus ? appColor : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedValue,
                          hint: Text("Rôle"),
                          items: role.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Lien du projet",
                    keyboardType: TextInputType.text,
                    controller: lien,
                  ),
                  Gap(1.h),
                  Text("Durée du projet"),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          hintText: "2025",
                          keyboardType: TextInputType.number,
                          controller: year,
                          validatorMessage: "Année début projet",
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text("An"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InputText(
                          hintText: "2025",
                          keyboardType: TextInputType.number,
                          controller: month,
                          validatorMessage: "Année fin projet",
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 15.0),
                            child: Text("An"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Vous travaillez toujours sur ce projet",
                        style: TextStyle(
                          color: appColorBlue,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 15.sp,
                        ),
                      ),
                      Transform.scale(
                        scaleX: 0.5,
                        scaleY: 0.5,
                        child: Switch(
                          activeColor: appColorBlue,
                          padding: EdgeInsets.all(-10),
                          thumbIcon: thumbIcon,
                          value: light,
                          onChanged: (bool value) {
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Description du projet",
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    controller: description,
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
            if (_formKeyProject.currentState!.validate()) {
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }
}
