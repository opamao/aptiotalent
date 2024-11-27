import 'package:aptiotalent/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/constants.dart';
import '../../../../widgets/widgets.dart';
import '../../forgot/forgot.dart';
import '../../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

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
                    backgroundColor: appColor.withOpacity(.08),
                    foregroundColor: appColor.withOpacity(.08),
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
                        color: appColor.withOpacity(.1),
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
                          "Connexion a votre compte",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          "Bienvenu à vous, vous nous avez manqué !",
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
                  InputPassword(
                    hintText: "Mot de passe",
                    controller: password,
                    validatorMessage: "Veuillez saisir votre mot de passe",
                    suffixIcon: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        }),
                  ),
                  Gap(1.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Mot de passe oublié?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Gap(1.h),
                  SubmitButton(
                    AppConstants.btnLogin,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                      }
                    },
                  ),
                  Gap(3.h),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Vous n'avez pas de compte? S'enregistrer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: appColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
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
