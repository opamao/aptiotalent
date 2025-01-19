import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';
import '../../menus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Paramètres"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Paramètre de notification"),
              leading: Icon(
                Icons.notifications_outlined,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Gérer mot de passe"),
              leading: Icon(
                Icons.lock_outline_rounded,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordManagerPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Supprimer son compte"),
              leading: Icon(
                Icons.delete_outline_outlined,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: appWhite,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 300,
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Vous ne pourrez plus suivre vos activités personnelles. Êtes-vous sûr?",
                              style: TextStyle(
                                color: appBlack,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(2.h),
                            Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: appColor.withValues(alpha: .1),
                                borderRadius: BorderRadius.circular(3.w),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.info_outline,
                                  color: appColor,
                                ),
                                title: Text(
                                  "La suppression de votre compte sera "
                                  "irrévessible. Toutes vos informations et "
                                  "aux offres vous avez postuler seront supprimer.",
                                  style: TextStyle(
                                    color: appColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Gap(2.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CancelButton(
                                    AppConstants.btnCancel,
                                    height: 10.w,
                                    fontSize: 15.sp,
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                                Expanded(
                                  child: SubmitButton(
                                    AppConstants.btnDelete,
                                    height: 10.w,
                                    fontSize: 15.sp,
                                    couleur: Colors.red,
                                    onPressed: () async {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text("Thème"),
              leading: Icon(
                Icons.dark_mode_outlined,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
