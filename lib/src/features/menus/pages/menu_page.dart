import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../themes/themes.dart';
import '../../home/home.dart';
import '../../notifications/notifs.dart';
import '../../profiles/profiles.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;

  final Widget _home = HomePage();
  final Widget _book = Container();
  final Widget _message = Container();
  final Widget _profile = ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        title: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_outlined,
                color: appColor,
              ),
              Gap(2.w),
              Text("Recherches d'emplois")
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
            icon: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
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
                                      color: appColor.withOpacity(.12),
                                      thicknessUnit: GaugeSizeUnit.factor,
                                    ),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: 100,
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
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: Container(
                                padding: EdgeInsets.all(.5.w),
                                decoration: BoxDecoration(
                                  color: appWhite,
                                  borderRadius: BorderRadius.circular(1.w),
                                ),
                                child: Text(
                                  "100%",
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
                                  color: appBlack,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(2.w),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: appColor,
                            size: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text("Emplois enregistrés"),
                    leading: Icon(
                      Icons.bookmark_border_outlined,
                      color: appColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Obtenir de l'aide"),
                    leading: Icon(
                      Icons.chat_bubble_outline_outlined,
                      color: appColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Langues"),
                    leading: Icon(
                      Icons.language_outlined,
                      color: appColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Paramètres"),
                    leading: Icon(
                      Icons.settings_outlined,
                      color: appColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Notifications"),
                    leading: Icon(
                      Icons.notifications_outlined,
                      color: appColor,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Centre d'aide"),
                    leading: Icon(
                      Icons.help_outline_outlined,
                      color: appColor,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AptioTalent",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Version 1.0.0",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: appBlack,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: appWhite,
        surfaceTintColor: appWhite,
        indicatorColor: appColor,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: currentPageIndex == 0 ? appWhite : appBlack,
            ),
            label: "Accueil",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: currentPageIndex == 1 ? appWhite : appBlack,
            ),
            label: "Postuler",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.chat_bubble_outline_outlined,
              color: currentPageIndex == 2 ? appWhite : appBlack,
            ),
            label: "Messages",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline_outlined,
              color: currentPageIndex == 3 ? appWhite : appBlack,
            ),
            label: "Profil",
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (currentPageIndex == 0) {
      return _home;
    } else if (currentPageIndex == 1) {
      return _book;
    } else if (currentPageIndex == 2) {
      return _message;
    } else {
      return _profile;
    }
  }
}
