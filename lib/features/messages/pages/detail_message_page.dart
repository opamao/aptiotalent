import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';

class DetailMessagePage extends StatefulWidget {
  const DetailMessagePage({super.key});

  @override
  State<DetailMessagePage> createState() => _DetailMessagePageState();
}

class _DetailMessagePageState extends State<DetailMessagePage> {
  final _formKeyMessage = GlobalKey<FormState>();

  var message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: Form(
          key: _formKeyMessage,
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
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Entreprise",
            style: TextStyle(
              color: appBlack,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Est en ligne",
            style: TextStyle(
              color: appBlack,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(3.w)),
            child: Icon(
              Icons.person_outline_outlined,
              color: appColor,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone_in_talk_outlined,
              color: appColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_camera_front_outlined,
              color: appColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
