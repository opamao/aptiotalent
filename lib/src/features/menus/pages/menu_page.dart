import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;

  final Widget _home = Container();
  final Widget _book = Container();
  final Widget _message = Container();
  final Widget _profile = Container();

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
