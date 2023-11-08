// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:resumes_1/data/util.dart';

class Technical_Skills extends StatefulWidget {
  const Technical_Skills({Key? key});

  @override
  State<Technical_Skills> createState() => _Technical_SkillsState();
}

class _Technical_SkillsState extends State<Technical_Skills> {
  List<Map<int, String>> skills = [];
  int skillLimit = 1;

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
                    'Technical Skills',
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'Enter Your Skills',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10),
                            ...MyUtil.mySkills.asMap().entries.map(
                              (entry) {
                                final index = entry.key;
                                final e = entry.value;
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: TextField(
                                          controller: e,
                                          decoration: InputDecoration(
                                            hintText: 'Enter skill',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            skillLimit--;
                                            MyUtil.mySkills.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 20),
                            if (skillLimit < 10)
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      skillLimit++;
                                      MyUtil.mySkills
                                          .add(TextEditingController());
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('work_space');
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
