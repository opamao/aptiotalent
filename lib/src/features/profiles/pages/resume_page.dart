import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final _formKeyResume = GlobalKey<FormState>();

  var resume = TextEditingController();

  final _snackBar = const SnackBar(
    content: Text("Saisissez au mois une phrase"),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(title: Text("Résumé profil"),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyResume,
              child: InputText(
                hintText: "Présentez vous...",
                maxLines: 10,
                keyboardType: TextInputType.text,
                controller: resume,
                validatorMessage: "Parlez vous de nous",
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
            if (_formKeyResume.currentState!.validate()) {
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
