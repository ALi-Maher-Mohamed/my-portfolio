import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/constant/colors.dart';

import '../../core/constant/nav_titles_and_func.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: CustomColors.scaffold1,
        child: ListView(children: [
          for (int i = 0; i < navTiltles.length; i++)
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              leading: Icon(navIcons[i]),
              title: Text(navTiltles[i]),
            )
        ]));
  }
}
