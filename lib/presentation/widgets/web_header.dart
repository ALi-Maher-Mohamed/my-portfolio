import 'package:Ali_Maher/presentation/widgets/custom_nav_text_button.dart';
import 'package:Ali_Maher/presentation/widgets/side_logo.dart';
import 'package:flutter/material.dart';
import '../../core/constant/nav_titles_and_func.dart';

class WebHeader extends StatelessWidget {
  final void Function(int) onNavItemTap;

  const WebHeader({
    super.key,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SideLogo(
            onTap: () => onNavItemTap(0), // Home section
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 2),
          Row(
            children: [
              for (int i = 0; i < navTiltles.length; i++)
                CustomTextButton(
                  onPressed: () => onNavItemTap(i),
                  title: navTiltles[i],
                ),
            ],
          )
        ],
      ),
    );
  }
}
