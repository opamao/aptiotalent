import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';
import '../register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  var email = TextEditingController();
  var phone = TextEditingController();
  var name = TextEditingController();
  var lastName = TextEditingController();
  var password = TextEditingController();

  String phoneIndicator = "";
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  late bool _isChecked = false;
  String? _selectedGender;

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
                    heroTag: 'backOne',
                    shape: CircleBorder(),
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: appColor.withValues(alpha:.08),
                    foregroundColor: appColor.withValues(alpha:.08),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: appColor,
                    ),
                  ),
                  Gap(1.h),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Complétez votre profil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          "Rassurez-vous, vos données personnelles ne sont "
                          "visibles que par vous. Personne d'autre "
                          "n'y aura accès.",
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
                  Gap(1.h),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue[100],
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: appColor,
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              size: 12,
                              color: appColor,
                            ),
                            label: Text(
                              "Photo",
                              style: TextStyle(
                                color: appColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildRadioOption("Homme"),
                      Gap(1.h),
                      _buildRadioOption("Femme"),
                      Gap(1.h),
                      _buildRadioOption("Autres"),
                    ],
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Nom",
                    keyboardType: TextInputType.text,
                    controller: name,
                    validatorMessage: "Veuillez saisir votre nom",
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Prénom",
                    keyboardType: TextInputType.text,
                    controller: lastName,
                    validatorMessage: "Veuillez saisir votre prénom",
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Adresse e-mail",
                    keyboardType: TextInputType.text,
                    controller: email,
                    validatorMessage: "Veuillez saisir votre email",
                  ),
                  Gap(1.h),
                  Container(
                    padding: EdgeInsets.only(left: 4.w),
                    decoration: BoxDecoration(
                      color: appColor.withValues(alpha:.08),
                      borderRadius: BorderRadius.circular(3.w),
                      border: Border.all(
                        color: _isFocused ? appColor : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: InternationalPhoneNumberInput(
                      focusNode: _focusNode,
                      onInputChanged: (PhoneNumber number) {
                        phoneIndicator = number.phoneNumber!;
                        print(phoneIndicator);
                      },
                      onInputValidated: (bool value) {},
                      errorMessage: "Le numéro est invalide",
                      hintText: "Numéro de téléphone",
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      initialValue: number,
                      textFieldController: phone,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      onSaved: (PhoneNumber number) {},
                    ),
                  ),
                  Gap(1.h),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          "J'accepte toutes les conditions, la confidentialité et les frais",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                  SubmitButton(
                    AppConstants.btnRegister,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextOnePage(),
                          ),
                        );
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

  Widget _buildRadioOption(String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                _selectedGender == value ? appColor : appColor.withValues(alpha:.2),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: RadioListTile<String>(
          value: value,
          groupValue: _selectedGender,
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue;
            });
            print("Gender Selected: $newValue");
          },
          title: Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          activeColor: appColor,visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
        ),
      ),
    );
  }
}
