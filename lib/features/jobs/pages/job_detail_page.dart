import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/widgets.dart';
import '../../entreprises/entreprises.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          AppConstants.btnApply,
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        title: Text("Détail Job"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: appColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      color: appColor.withValues(alpha: .08),
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
                title: Text(
                  "Développeur mobile flutter",
                  style: TextStyle(
                    color: appBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                subtitle: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntreprisePage(),
                      ),
                    );
                  },
                  child: Text(
                    "AptioTech",
                    style: TextStyle(
                      color: appColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Gap(2.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: appColor.withValues(alpha: .2),
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
                            color: appColor.withValues(alpha: .2),
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
                            color: appColor.withValues(alpha: .2),
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
                    Gap(2.h),
                    Divider(),
                  ],
                ),
              ),
              TabBar.secondary(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(text: 'À propos'),
                  Tab(text: 'Entreprise'),
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
                              "À propos du rôle",
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
                          ],
                        ),
                      ),
                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          padding: EdgeInsets.all(1 .w),
                                          decoration: BoxDecoration(
                                            color:
                                                appColor.withValues(alpha: .2),
                                            borderRadius:
                                                BorderRadius.circular(3.w),
                                            border: Border.all(
                                              color: appColor.withValues(
                                                  alpha: .08),
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
      ),
    );
  }
}
