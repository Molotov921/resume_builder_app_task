// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screen/achievements.dart';
import 'Screen/carrier_objective.dart';
import 'Screen/contact_info.dart';
import 'Screen/declaration.dart';
import 'Screen/experiences.dart';
import 'Screen/personal_details.dart';
import 'Screen/projects.dart';
import 'Screen/references.dart';
import 'Screen/technical_skills.dart';
import 'Screen/splash_screen.dart';
import 'Screen/work_space.dart';
import 'Screen/eduction.dart';
import 'Screen/resume.dart';

void main() {
  SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarColor: Colors.lightBlue,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'place_screen',
      routes: {
        '/': (context) => Home_Page(),
        'place_screen': (context) => Splash_Screen(),
        'contact_info': (context) => Contact_Info(),
        'work_space': (context) => Work_Space(),
        'carrier_objective': (context) => Carrier_Objective(),
        'personal_details': (context) => Personal_Details(),
        'eduction': (context) => Eduction(),
        'experiences': (context) => Experiences(),
        'technical_skills': (context) => Technical_Skills(),
        'projects_page': (context) => Projects_Page(),
        'achievements_page': (context) => Achievements_Page(),
        'refernces_page': (context) => references(),
        'declaration': (context) => declaration(),
        'resume': (context) => Resume(),
      },
      debugShowCheckedModeBanner: false,
      // home: Home_Page(),
    );
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 190,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Text(
                    "Resume Builder",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "RESUMES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            color: Colors.blue,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  child: Image.asset(
                    "img/open-cardboard-box.png",
                  ),
                  height: 50,
                  width: 100,
                  color: Colors.white10,
                ),
              ),
            ],
          ),
          Text(
            "No Resumes + Create new resume.",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black38),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('work_space');
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
