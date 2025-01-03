import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class EntreprisePage extends StatefulWidget {
  const EntreprisePage({super.key});

  @override
  State<EntreprisePage> createState() => _EntreprisePageState();
}

class _EntreprisePageState extends State<EntreprisePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> images = [
    'https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg',
    'https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg',
    'https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg',
    'https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg',
    'https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg',
    'https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("AptioTalent"),
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.language_outlined,
              color: appColor,
              size: 20,
            ),
            onPressed: () {},
            label: Text(
              "Site web",
              style: TextStyle(
                color: appColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: appColor.withValues(alpha: .2),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.w),
                          color: appWhite,
                          border: Border.all(
                            color: appColor.withValues(alpha: .08),
                          ),
                        ),
                        child: Image.network(
                          "https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg?semt=ais_hybrid",
                          fit: BoxFit.fill,
                          height: 60,
                          width: 65,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported);
                          },
                        ),
                      ),
                      Text(
                        "AptioTalent",
                        style: TextStyle(
                          color: appBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "IT Technology Solutions",
                        style: TextStyle(
                          color: appBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TabBar.secondary(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(text: 'À propos'),
                Tab(text: 'Gallerie'),
                Tab(text: 'Job'),
                Tab(text: 'Notes'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "À propos de l'entreprise",
                            style: TextStyle(
                              color: appBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            AppConstants.txtLoren,
                            style: TextStyle(
                              color: appBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.language_outlined,
                                        color: appColor,
                                        size: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Website",
                                      style: TextStyle(
                                        color: appBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "www.aptiotech.com",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: appColor,
                                        size: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Siège",
                                      style: TextStyle(
                                        color: appBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Abidjan, Marcory, CI",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: appColor,
                                        size: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Création",
                                      style: TextStyle(
                                        color: appBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "2025",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Gap(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.attach_money_outlined,
                                        color: appColor,
                                        size: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Revenus",
                                      style: TextStyle(
                                        color: appBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "1 000 000 XOF",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 colonnes
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1, // Carré
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  ListView(
                    children: [
                      Card(
                        surfaceTintColor: appWhite,
                        color: appWhite,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Développeur mobile flutter",
                                style: TextStyle(
                                  color: appBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_border_outlined,
                                ),
                              ),
                              leading: Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.w),
                                  border: Border.all(
                                    color: appColor.withValues(alpha:.08),
                                  ),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg?semt=ais_hybrid",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.image_not_supported);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                                bottom: 4.w,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "XOF ",
                                              style: TextStyle(
                                                color: appColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "250 000 - 800 000",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 20,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "4.7",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(2.h),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                          color: appColor.withValues(alpha:.2),
                                          borderRadius: BorderRadius.circular(3.w),
                                        ),
                                        child: Text(
                                          "Full-Time",
                                          style: TextStyle(
                                            color: appColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Gap(2.w),
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                          color: appColor.withValues(alpha:.2),
                                          borderRadius: BorderRadius.circular(3.w),
                                        ),
                                        child: Text(
                                          "Remote",
                                          style: TextStyle(
                                            color: appColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Gap(2.w),
                                      Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                          color: appColor.withValues(alpha:.2),
                                          borderRadius: BorderRadius.circular(3.w),
                                        ),
                                        child: Text(
                                          "Director",
                                          style: TextStyle(
                                            color: appColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(2.h),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: appBlack,
                                                size: 20,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Abidjan, Côte d'Ivoire",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "5 Jours",
                                        style: TextStyle(
                                          color: appBlack,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.normal,
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
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              border: Border.all(
                                color: appColor.withValues(alpha: .08),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "4.5",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "/5",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "2.7k Évaluation",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "5",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: LinearProgressIndicator(
                                                value: 1,
                                                color: appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "4 star",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: LinearProgressIndicator(
                                                value: .8,
                                                color: appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "3",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: LinearProgressIndicator(
                                                value: .6,
                                                color: appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "2",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: LinearProgressIndicator(
                                                value: .4,
                                                color: appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "1",
                                              style: TextStyle(
                                                color: appBlack,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: LinearProgressIndicator(
                                                value: .2,
                                                color: appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Commentaires",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "+ Questionnaire",
                                  style: TextStyle(
                                    color: appColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              border: Border.all(
                                color: appColor.withValues(alpha: .08),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(1.w),
                                        decoration: BoxDecoration(
                                          color: appColor.withValues(alpha: .2),
                                          borderRadius:
                                              BorderRadius.circular(3.w),
                                          border: Border.all(
                                            color:
                                                appColor.withValues(alpha: .08),
                                          ),
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.star,
                                                  color: appColor,
                                                  size: 20,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "5.0",
                                                style: TextStyle(
                                                  color: appColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        "Anonyme",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: appBlack,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(2.h),
                                Text(
                                  AppConstants.txtLoren,
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
