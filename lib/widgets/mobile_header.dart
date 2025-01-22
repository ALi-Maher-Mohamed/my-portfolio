import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_portfolio/constant/colors.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/custom_nav_text_button.dart';
import 'package:my_portfolio/widgets/side_logo.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kHeaderDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        SideLogo(
          onTap: onLogoTap,
        ),
        Spacer(),
        IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu)),
        SizedBox(
          width: 16,
        )
      ]),
    );
  }
}
