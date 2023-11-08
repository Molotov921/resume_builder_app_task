// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../data/util.dart';

class Eduction extends StatefulWidget {
  const Eduction({Key? key});

  @override
  _EductionState createState() => _EductionState();
}

class _EductionState extends State<Eduction> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController courseController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();
  TextEditingController passingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            color: Colors.blue,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
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
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.blue,
                  child: Text(
                    'Education',
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
            flex: 9,
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: globalKey,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course/Degree',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Course/Degree ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              MyUtil.myCourseDegree = val!;
                            },
                            controller: courseController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "B. Tech Computer Engineering",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'School/College/Institute',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your School/College/Institute ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              MyUtil.mySchoolColIns = val!;
                            },
                            controller: schoolController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "University Name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'CGPA/Percentage',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your CGPA/Percentage ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              MyUtil.myCgpa = val!;
                            },
                            controller: cgpaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "75 % (or) 7.5 CGPA",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Year of Passing',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Year of Passing ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              MyUtil.myPassingYear = val!;
                            },
                            controller: passingController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "2025",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13),
                                child: SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      globalKey.currentState!.reset();
                                      courseController.clear();
                                      schoolController.clear();
                                      cgpaController.clear();
                                      passingController.clear();
                                      MyUtil.myCourseDegree = '';
                                      MyUtil.mySchoolColIns = '';
                                      MyUtil.myCgpa = '';
                                      MyUtil.myPassingYear = '';
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (globalKey.currentState!.validate()) {
                                      globalKey.currentState!.save();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text('Save done...'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamed('work_space');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('Please fill all Fields...'),
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
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
