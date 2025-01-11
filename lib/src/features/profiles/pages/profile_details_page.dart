import 'package:aptiotalent/constants/constants.dart';
import 'package:aptiotalent/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../profiles.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
              ],
            ),
          ),
          Gap(2.w),
          Divider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(4.w),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BasicPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.email_outlined,
                                              color: appColor,
                                              size: 17,
                                            ),
                                          ),
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " E-mail",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "theodoreyapi@gmail.com",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.location_on_outlined,
                                              color: appColor,
                                              size: 17,
                                            ),
                                          ),
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " Localisation",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "CI, Marcory résidentiel",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.phone_callback_outlined,
                                              color: appColor,
                                              size: 17,
                                            ),
                                          ),
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " Téléphone",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "+2250585831647",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons
                                                  .home_repair_service_outlined,
                                              color: appColor,
                                              size: 17,
                                            ),
                                          ),
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " Expérience",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "8 An(s)",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.money_outlined,
                                              color: appColor,
                                              size: 17,
                                            ),
                                          ),
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: " Salaire",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "20 000 000 XOF/An",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    child: Column(
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResumePage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Text(
                            AppConstants.txtLoren,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
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
                    child: Column(
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Secteur d'activité actuel",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "IT Services & Consulting",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: appColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(1.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Département actuel",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Dev Apps",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: appColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(1.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Catégorie du rôle actuel",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "DSI",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: appColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(1.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Fonction actuelle",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Dev Flutter & Dart",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: appColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    child: Column(
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmploiPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      color: appWhite,
                                      borderRadius: BorderRadius.circular(2.w),
                                      border: Border.all(
                                        color: appColor.withValues(alpha: .12),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.home_work_outlined,
                                      size: 35,
                                    ),
                                  ),
                                  Gap(2.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dev mobile Flutter & Dart",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Entreprise",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: appColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Décembre 2024 - Aujourd'hui (1 an(s))",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(1.h),
                            ],
                          ),
                        ),
                      ],
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
                    child: Column(
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EducationPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      color: appWhite,
                                      borderRadius: BorderRadius.circular(2.w),
                                      border: Border.all(
                                        color: appColor.withValues(alpha: .12),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.school_outlined,
                                      size: 35,
                                    ),
                                  ),
                                  Gap(2.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dev mobile Flutter & Dart",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "École",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: appColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Décembre 2024 - Janvier 2027",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(1.h),
                            ],
                          ),
                        ),
                      ],
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjetPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Titre projet",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Lien",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: appColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Décembre 2024 - Janvier 2027",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Visite",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: appColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(1.h),
                            ],
                          ),
                        ),
                      ],
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SkillsPage(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              color: appColor,
                              size: 14.sp,
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha: .12),
                                  ),
                                ),
                                child: Text(
                                  "CSS",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha: .12),
                                  ),
                                ),
                                child: Text(
                                  "Flutter",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha: .12),
                                  ),
                                ),
                                child: Text(
                                  "Dart",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha: .12),
                                  ),
                                ),
                                child: Text(
                                  "JS",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha: .12),
                                  ),
                                ),
                                child: Text(
                                  "JAVA",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    child: Column(
                      children: [
                        ListTile(
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
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CvPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                color: appColor.withValues(alpha: .2),
                                borderRadius: BorderRadius.circular(2.w),
                                border: Border.all(
                                  color: appColor,
                                ),
                              ),
                              child: Text(
                                AppConstants.btnUpdate,
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha: .12),
                                  ),
                                ),
                                child: Icon(
                                  Icons.picture_as_pdf_outlined,
                                  size: 35,
                                  color: appColor,
                                ),
                              ),
                              Gap(2.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Titre du CV",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Dernière mise à jour: 12 Janvier 2024",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gap(1.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
