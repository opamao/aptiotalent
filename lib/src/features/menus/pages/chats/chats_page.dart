import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../themes/themes.dart';
import '../../../../widgets/widgets.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final _formKeyTalent = GlobalKey<FormState>();

  var message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("AptioTalent"),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: Form(
          key: _formKeyTalent,
          child: Row(
            children: [
              Expanded(
                child: InputText(
                  hintText: "Saisissez votre message...",
                  keyboardType: TextInputType.text,
                  controller: message,
                  validatorMessage: "Veuillez saisir message",
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_outlined,
                  color: appColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
