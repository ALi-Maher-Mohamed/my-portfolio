import 'package:flutter/material.dart';
import 'package:my_portfolio/constant/colors.dart';
import 'package:my_portfolio/constant/size.dart';
import 'package:my_portfolio/widgets/about_me_web.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/mobile_header.dart';
import 'package:my_portfolio/widgets/my_skills_web.dart';
import 'package:my_portfolio/widgets/web_header.dart';

import '../widgets/main_desktop.dart';
import '../widgets/main_mobile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer:
            constraints.maxWidth >= kMinDisktpWidth ? null : MobileDrawer(),
        body: ListView(children: [
          //main
          SizedBox(
            height: screenHeight,
            width: double.infinity,
            // decoration: BoxDecoration(color: CustomColors.scaffold1),
            child: Stack(children: [
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Opacity(
                  opacity: 0.2, // خفف الصورة (من 0.0 إلى 1.0)
                  child: Image.asset(
                    'assets/MyPhoto/image.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  if (constraints.maxWidth >= kMinDisktpWidth)
                    WebHeader()
                  else
                    MobileHeader(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                  if (constraints.maxWidth >= kMinDisktpWidth)
                    MainDesktop(
                      screenSize: screenSize,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    )
                  else
                    MainMobile(
                        screenHeight: screenHeight, screenWidth: screenWidth)
                ],
              ),
            ]),
          ),
          Container(
            width: screenWidth,
            decoration: BoxDecoration(color: CustomColors.scaffold2),
            child: AboutMeSection(),
          ),
          //project
          SkillsSectionWeb(),
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

// class SkillsDesktop extends StatelessWidget {
//   const SkillsDesktop({
//     super.key,
//     required this.screenHeight,
//   });

//   final double screenHeight;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Flexible(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: 450),
//               child: Wrap(
//                 spacing: screenHeight / 60,
//                 runSpacing: screenHeight / 60,
//                 children: [
//                   for (int i = 0; i < 4; i++)
//                     Container(
//                       width: 200,
//                       decoration: BoxDecoration(
//                           color: CustomColors.scaffold1,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: ListTile(
//                         leading: Icon(
//                           Icons.code,
//                           color: Colors.white,
//                         ),
//                         title: Text(
//                           'Mobile Development',
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 50),
//           Flexible(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxWidth: 500,
//               ),
//               child: Wrap(
//                 spacing: screenHeight / 100,
//                 runSpacing: screenHeight / 100,
//                 children: [
//                   for (int i = 0; i < 10; i++)
//                     Chip(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 16),
//                       label: Text('data'),
//                       avatar: Icon(Icons.code),
//                     )
//                 ],
//               ),
//             ),
//           )
//         ]);
//   }
// }
