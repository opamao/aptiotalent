import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/themes/themes.dart';
import '../profiles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 9.h,
                        width: 9.h,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: false,
                              showTicks: false,
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.1,
                                cornerStyle: CornerStyle.bothCurve,
                                color: appColor.withValues(alpha: .12),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: 25,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 0.1,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  color: appColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: Image.network(
                            "https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg?semt=ais_hybrid",
                            height: 7.h,
                            width: 7.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image_not_supported);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(.5.w),
                          decoration: BoxDecoration(
                            color: appWhite,
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                          child: Text(
                            "25%",
                            style: TextStyle(
                              color: appBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(2.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yapi n'guessan kouassi théodore",
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "Développeur mobile",
                          style: TextStyle(
                            color: appColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(2.w),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetailsPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: appColor,
                      size: 18.sp,
                    ),
                  ),
                ],
              ),
              Divider(),
              Gap(2.h),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
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
                        leading: Icon(
                          Icons.person_outline_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BasicPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Résumé profil",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.sticky_note_2_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResumePage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Infos professionnelles",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.dns_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Emploi",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.badge_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmploiPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Education",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.school_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EducationPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Projets",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.donut_large_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjetPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Compétences clés",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.widgets_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SkillsPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appColor.withValues(alpha: .12),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: ListTile(
                        title: Text(
                          "Curriculum vitae / CV",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          Icons.sticky_note_2_outlined,
                          color: appColor,
                        ),
                        trailing: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CvPage(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: appColor,
                            size: 14.sp,
                          ),
                          label: Text(
                            "Ajouter",
                            style: TextStyle(
                              color: appColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
