import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';
import '../forgot.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _formKey = GlobalKey<FormState>();

  var login = TextEditingController();
  var password = TextEditingController();

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'back',
                    shape: CircleBorder(),
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: appColor.withValues(alpha:.08),
                    foregroundColor: appColor.withValues(alpha:.08),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: appColor,
                    ),
                  ),
                  Gap(2.h),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: appColor.withValues(alpha:.1),
                        borderRadius: BorderRadius.all(Radius.circular(8.w)),
                      ),
                      child: Icon(
                        Icons.settings_input_composite,
                        color: appColor,
                      ),
                    ),
                  ),
                  Gap(2.h),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Mot de passe oublié",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          "Entrez votre adresse e-mail qui est associé a votre "
                          "compte et vous receverai un mail pour "
                          "réinitialisation de mot de passe.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(2.h),
                  InputText(
                    hintText: "Adresse e-mail",
                    keyboardType: TextInputType.text,
                    controller: login,
                    validatorMessage: "Veuillez saisir votre email",
                  ),
                  Gap(2.h),
                  SubmitButton(
                    AppConstants.btnPassword,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CodeOtpPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
