import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../../bookmark/bookmark.dart';
import '../../home/home.dart';
import '../../messages/pages/pages.dart';
import '../../notifications/notifs.dart';
import '../../profiles/profiles.dart';
import '../../searchs/searchs.dart';
import '../menus.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;

  final Widget _home = HomePage();
  final Widget _book = BookmarkPage();
  final Widget _message = MessagePage();
  final Widget _profile = ProfilePage();

  var search = TextEditingController();
  var location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        title: TextButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.topCenter, // Positionner en haut
                  child: Material(
                    color: Colors.transparent, // Fond transparent pour le reste
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      // Largeur ajustable
                      margin: EdgeInsets.only(top: 50),
                      // Marges depuis le haut
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: appWhite,
                        borderRadius: BorderRadius.circular(3.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InputText(
                            keyboardType: TextInputType.text,
                            controller: search,
                            hintText: "Titre du poste, Entreprise...",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.home_repair_service_outlined,
                                color: appColor,
                              ),
                            ),
                          ),
                          Gap(1.h),
                          InputText(
                            keyboardType: TextInputType.text,
                            controller: location,
                            hintText: "Commune, Ville, Pays",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.my_location_outlined,
                                color: appColor,
                              ),
                            ),
                          ),
                          Gap(2.h),
                          Row(
                            children: [
                              Expanded(
                                child: CancelButton(
                                  AppConstants.btnClose,
                                  height: 10.w,
                                  fontSize: 15.sp,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SubmitButton(
                                  AppConstants.btnSearch,
                                  height: 12.w,
                                  fontSize: 15.sp,
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultSearchPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
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
        backgroundColor: appWhite,
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
                                      color: appColor.withValues(alpha: .12),
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
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.image_not_supported);
                                  },
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
                  ListTile(
                    title: const Text("Emplois enregistrés"),
                    leading: Icon(
                      Icons.bookmark_border_outlined,
                      color: appColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobSavedPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Statut de recherche d'emploi"),
                    leading: Icon(
                      Icons.remove_red_eye_outlined,
                      color: appColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobStatusPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Obtenir de l'aide"),
                    leading: Icon(
                      Icons.chat_bubble_outline_outlined,
                      color: appColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Langues"),
                    leading: Icon(
                      Icons.language_outlined,
                      color: appColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguagePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Paramètres"),
                    leading: Icon(
                      Icons.settings_outlined,
                      color: appColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Centre d'aide"),
                    leading: Icon(
                      Icons.help_outline_outlined,
                      color: appColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpsPage(),
                        ),
                      );
                    },
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
                        AppConstants.appName,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppConstants.appVersion,
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
