import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes/themes.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;

  final Widget _home = Container();
  final Widget _historique = Container();
  final Widget _actualite = Container();
  final Widget _profil = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Container(
              padding: EdgeInsets.only(left: 1.w),
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "15 000 ",
                    style: TextStyle(
                      color: appWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  CircleAvatar(
                    radius: 15.sp,
                    backgroundColor: appWhite,
                    foregroundColor: appWhite,
                    child: Text(
                      "F",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
              Icons.sports_soccer_outlined,
              color: currentPageIndex == 0 ? appWhite : appBlack,
            ),
            label: "Sports",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.history_outlined,
              color: currentPageIndex == 1 ? appWhite : appBlack,
            ),
            label: "Historique",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.newspaper_outlined,
              color: currentPageIndex == 2 ? appWhite : appBlack,
            ),
            label: "Actualité",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outlined,
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
      return _historique;
    } else if (currentPageIndex == 2) {
      return _actualite;
    } else {
      return _profil;
    }
  }
}
