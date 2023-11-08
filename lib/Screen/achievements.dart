// ignore_for_file: camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Achievements_Page extends StatefulWidget {
  const Achievements_Page({Key? key});

  @override
  State<Achievements_Page> createState() => _Achievements_PageState();
}

class _Achievements_PageState extends State<Achievements_Page> {
  List<TextEditingController> achievementsControllers = [
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment(-1, 0.5),
                  height: 80,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('work_space');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(0, 0.5),
                  height: 80,
                  color: Colors.blue,
                  child: Text(
                    'Achievements',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Enter Achievements',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 20),
                          for (int i = 0;
                              i < achievementsControllers.length;
                              i++)
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextField(
                                      controller: achievementsControllers[i],
                                      decoration: InputDecoration(
                                        hintText: 'Enter Achievements',
                                        hintStyle: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        achievementsControllers.removeAt(i);
                                      });
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 20),
                          if (achievementsControllers.length < 10)
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    achievementsControllers
                                        .add(TextEditingController());
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          Container(
                            height: 50,
                            width: 310,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('work_space');
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
