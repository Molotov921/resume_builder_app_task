// ignore_for_file: camel_case_types, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../data/util.dart';

class Work_Space extends StatefulWidget {
  const Work_Space({super.key});

  @override
  State<Work_Space> createState() => _Work_SpaceState();
}

class _Work_SpaceState extends State<Work_Space> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              color: Colors.blue,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment(-1, 0.5),
                              height: 100,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/');
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment(0, 0.5),
                              height: 100,
                              color: Colors.blue,
                              child: Text(
                                'Resume Workspace',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Centered Text "Build Options"
                            Container(
                              alignment:
                                  Alignment.centerRight, // Center the text
                              child: Text(
                                'Build Options',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                            // Adjusted Icon
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ...myCategoryName.map((e) {
              return Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'img/${e['img']}',
                      height: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${e['name']}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('${e['page']}');
                      },
                      icon: const Icon(Icons.navigate_next),
                      splashRadius: 20,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
