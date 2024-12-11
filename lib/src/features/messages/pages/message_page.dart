import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';
import '../messages.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appColor.withOpacity(.12),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMessagePage(),
                      ),
                    );
                  },
                  title: Text(
                    "Entreprise",
                    style: TextStyle(
                      color: appBlack,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Message",
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
                  trailing: Text(
                    "2 heures",
                    style: TextStyle(
                      color: appBlack,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
