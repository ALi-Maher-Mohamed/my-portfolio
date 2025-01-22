import 'package:flutter/material.dart';

import '../constant/colors.dart';

BoxDecoration kHeaderDecoration = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    CustomColors.scaffold1,
    CustomColors.scaffold2,
  ],
));
