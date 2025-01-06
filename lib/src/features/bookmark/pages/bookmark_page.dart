import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';
import '../../entreprises/entreprises.dart';
import '../../jobs/jobs.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage>
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(
            children: [
              TabBar.secondary(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(text: "Candidature"),
                  Tab(text: "Accepter"),
                  Tab(text: "Réfuser"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetailPage(),
                              ),
                            );
                          },
                          child: Card(
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
                                  subtitle: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EntreprisePage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "AptioTech",
                                      style: TextStyle(
                                        color: appColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                        color: appColor.withValues(alpha: .08),
                                      ),
                                    ),
                                    child: Image.network(
                                      "https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg?semt=ais_hybrid",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  text:
                                                      "Abidjan, Côte d'Ivoire",
                                                  style: TextStyle(
                                                    color: appBlack,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent
                                                  .withValues(alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                            ),
                                            child: Text(
                                              "Envoyé",
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 13.sp,
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
                        ),
                      ],
                    ),
                    ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetailPage(),
                              ),
                            );
                          },
                          child: Card(
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
                                  subtitle: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EntreprisePage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "AptioTech",
                                      style: TextStyle(
                                        color: appColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                        color: appColor.withValues(alpha: .08),
                                      ),
                                    ),
                                    child: Image.network(
                                      "https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg?semt=ais_hybrid",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  text:
                                                      "Abidjan, Côte d'Ivoire",
                                                  style: TextStyle(
                                                    color: appBlack,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                              color: Colors.green
                                                  .withValues(alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                            ),
                                            child: Text(
                                              "Accepté",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 13.sp,
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
                        ),
                      ],
                    ),
                    ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDetailPage(),
                              ),
                            );
                          },
                          child: Card(
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
                                  subtitle: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EntreprisePage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "AptioTech",
                                      style: TextStyle(
                                        color: appColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                        color: appColor.withValues(alpha: .08),
                                      ),
                                    ),
                                    child: Image.network(
                                      "https://img.freepik.com/psd-gratuit/illustration-3d-personne-lunettes-soleil_23-2149436188.jpg?semt=ais_hybrid",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                              color: appColor.withValues(
                                                  alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  text:
                                                      "Abidjan, Côte d'Ivoire",
                                                  style: TextStyle(
                                                    color: appBlack,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withValues(alpha: .2),
                                              borderRadius:
                                                  BorderRadius.circular(3.w),
                                            ),
                                            child: Text(
                                              "Refusé",
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 13.sp,
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
                        ),
                      ],
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
