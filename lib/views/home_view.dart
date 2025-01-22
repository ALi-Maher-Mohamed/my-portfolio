import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        //main
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.blueGrey),
        ),

        //about
        Container(
          height: 500,
          width: double.infinity,
          // decoration: BoxDecoration(color: Colors.blueGrey),
        ),
        //project
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.blueGrey),
        ),
        //skills
        Container(
          height: 500,
          width: double.infinity,
          // decoration: BoxDecoration(color: Colors.blueGrey),
        ),
      ],
    ));
  }
}
