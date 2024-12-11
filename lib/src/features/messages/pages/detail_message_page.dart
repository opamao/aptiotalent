import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class DetailMessagePage extends StatefulWidget {
  const DetailMessagePage({super.key});

  @override
  State<DetailMessagePage> createState() => _DetailMessagePageState();
}

class _DetailMessagePageState extends State<DetailMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMessagePage(),
              ),
            );
          },
          title: Text(
            "Entreprise",
            style: TextStyle(
              color: appBlack,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Message",
            style: TextStyle(
              color: appBlack,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(3.w)),
            child: Icon(
              Icons.person_outline_outlined,
              color: appColor,
            ),
          ),
        ),
      ),
    );
  }
}
