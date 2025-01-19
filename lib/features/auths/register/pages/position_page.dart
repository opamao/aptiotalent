import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../menus/menus.dart';

class PositionPage extends StatefulWidget {
  const PositionPage({super.key});

  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Où vous habitez"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: appColor.withValues(alpha:.08),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_outlined,
                color: appColor,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            InputText(
              keyboardType: TextInputType.text,
              controller: search,
              hintText: "Recherche",
              prefixIcon: Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.search_outlined,
                  color: appColor,
                ),
              ),
            ),
            Gap(2.h),
            ListTile(
              leading: Icon(
                Icons.my_location_outlined,
                color: appColor,
              ),
              title: Text(
                "Utiliser ma position actuelle",
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              trailing: CancelButton(
                AppConstants.btnYes,
                width: 22.w,
                height: 4.h,
                fontSize: 13.sp,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuPage(),
                    ),
                  );
                },
              ),
            ),
            Gap(2.h),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: appBlack,
                    ),
                    title: Text(
                      "Nom du lieux",
                      style: TextStyle(
                        color: appBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      "Description lieu",
                      style: TextStyle(
                        color: appBlack,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
