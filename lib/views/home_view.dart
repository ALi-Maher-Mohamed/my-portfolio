import 'package:flutter/material.dart';
import 'package:my_portfolio/constant/colors.dart';
import 'package:my_portfolio/constant/size.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/mobile_header.dart';
import 'package:my_portfolio/widgets/web_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer:
            constraints.maxWidth >= kMinDisktpWidth ? null : MobileDrawer(),
        body: ListView(children: [
          //main
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(color: CustomColors.scaffold1),
            child: Column(
              children: [
                if (constraints.maxWidth >= kMinDisktpWidth)
                  WebHeader()
                else
                  MobileHeader(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  )
              ],
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(color: CustomColors.scaffold2),
          ),
          //project
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(color: CustomColors.scaffold1),
          ),
          //skills
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(color: CustomColors.scaffold2),
          ),
        ]),
      );
    });
  }
}
