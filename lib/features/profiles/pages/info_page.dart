import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _formKeyInfo = GlobalKey<FormState>();

  var industry = TextEditingController();
  var department = TextEditingController();
  var category = TextEditingController();
  var role = TextEditingController();

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(title: Text("Info professionnelle"),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyInfo,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                    hintText: "Secteur d'activité actuel",
                    keyboardType: TextInputType.text,
                    controller: industry,
                    validatorMessage: "Veuillez remplir ce champs",
                  ),
                  Gap(2.h),
                  InputText(
                    hintText: "Département actuel",
                    keyboardType: TextInputType.text,
                    controller: department,
                    validatorMessage: "Veuillez remplir ce champs",
                  ),
                  Gap(2.h),
                  InputText(
                    hintText: "Catégorie du rôle actuel",
                    keyboardType: TextInputType.text,
                    controller: category,
                    validatorMessage: "Veuillez remplir ce champs",
                  ),
                  Gap(2.h),
                  InputText(
                    hintText: "Fonction actuelle",
                    keyboardType: TextInputType.text,
                    controller: role,
                    validatorMessage: "Veuillez remplir ce champs",
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
            if (_formKeyInfo.currentState!.validate()) {
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }
}
