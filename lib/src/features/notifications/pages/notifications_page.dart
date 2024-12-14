import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appColor.withValues(alpha:.12),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: ListTile(
                  title: Text(
                    "Détails basique",
                    style: TextStyle(
                      color: appBlack,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Une petite description du poste Une petite description "
                    "du poste Une petite description du poste ",
                    style: TextStyle(
                      color: appBlack,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  leading: Icon(
                    Icons.person_outline_outlined,
                    color: appColor,
                  ),
                  trailing: Text(
                    "2 jours",
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
