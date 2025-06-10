import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/custom_nav_text_button.dart';
import 'package:my_portfolio/widgets/side_logo.dart';
import '../constant/nav_titles_and_func.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: MediaQuery.of(context).size.height / 10,
        // decoration: kHeaderDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SideLogo(
              onTap: () {},
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 2),
            Row(
              children: [
                for (int i = 0; i < navTiltles.length; i++)
                  CustomTextButton(
                    onPressed: () {},
                    title: navTiltles[i],
                  ),
              ],
            )
          ],
        ));
  }
}
