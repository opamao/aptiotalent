import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({super.key});

  @override
  State<BasicPage> createState() => _BasicPageState();
}

const List<String> list = <String>[
  "FrontEnd developpeur",
  'UX/UI Design',
  'Full Stack developpeur',
  'PHP developpeur',
  'Flutter developpeur',
];

class _BasicPageState extends State<BasicPage> {
  final _formKeyBasic = GlobalKey<FormState>();

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
  var location = TextEditingController();
  var annee = TextEditingController();
  var mois = TextEditingController();
  var salaire = TextEditingController();

  String phoneIndicator = "";
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  String? _selectedGender;

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String? _selectedValue;
  bool _isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Informations basiques"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKeyBasic,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue[100],
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.blue,
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: -10,
                          child: ElevatedButton.icon(
                            onPressed: _pickImage,
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
                              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      color: appColor.withValues(alpha: .08),
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
                          hint: Text("Position actuelle"),
                          items: list.map((String value) {
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
                    hintText: "Ou vous habitez",
                    keyboardType: TextInputType.text,
                    controller: location,
                    validatorMessage: "Veuillez saisir votre lieu d'habitation",
                  ),
                  Gap(1.h),
                  Text("Expérience"),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: annee,
                          validatorMessage: "Pas d'année : 0",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text("An"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InputText(
                          hintText: "0",
                          keyboardType: TextInputType.number,
                          controller: mois,
                          validatorMessage: "Pas de mois : 0",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                            child: Text("Mois"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: " Salaire annuel",
                    keyboardType: TextInputType.number,
                    controller: salaire,
                    validatorMessage: "Pas de mois : 0",
                    prefixIcon: Container(
                      padding: EdgeInsets.only(left: 8.0, top: 15.0, right: 8.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          AppConstants.btnUpdate,
          onPressed: () async {
            if (_formKeyBasic.currentState!.validate()) {
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedGender == value
                ? appColor
                : appColor.withValues(alpha: .2),
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
          activeColor: appColor,
          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
        ),
      ),
    );
  }
}
