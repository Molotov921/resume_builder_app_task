// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../data/util.dart';

class Experiences extends StatefulWidget {
  const Experiences({Key? key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  bool isTrue = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController comNameController = TextEditingController();
  TextEditingController sCIController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  TextEditingController joinController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            height: 200,
            color: Colors.blue,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                    'Experiences',
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
              width: double.infinity,
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Company Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter Your Company Name ...';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            MyUtil.myComName = val!;
                          },
                          onFieldSubmitted: (val) {},
                          controller: comNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "New Enterprise, San Francisco",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              return 'Enter Your Role Name ...';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            MyUtil.mySCI = val!;
                          },
                          onFieldSubmitted: (val) {},
                          keyboardType: TextInputType.text,
                          controller: sCIController,
                          decoration: InputDecoration(
                            hintText: "Quality Test Engineer",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Roles (optional)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter Your Roles Detail ...';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            MyUtil.myRoles = val!;
                          },
                          onFieldSubmitted: (val) {},
                          controller: rolesController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Working with team Members',
                          ),
                          style: TextStyle(fontSize: 22),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Employed Status',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                isTrue = false;
                                MyUtil.myEmployedStatus = isTrue;
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Icon(
                                      (isTrue == false)
                                          ? Icons.radio_button_checked_rounded
                                          : Icons.radio_button_off_rounded,
                                      size: 15,
                                      color: (isTrue == false)
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Previously Employed',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: (isTrue == false)
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                isTrue = true;
                                MyUtil.myEmployedStatus = isTrue;
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Icon(
                                      (isTrue == true)
                                          ? Icons.radio_button_checked_rounded
                                          : Icons.radio_button_off_rounded,
                                      size: 15,
                                      color: (isTrue == true)
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Currently Employed',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: (isTrue == true)
                                            ? Colors.blue
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        (isTrue == false)
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Date Joined',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return 'Enter Your Joining Date ...';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            MyUtil.myJoinDate = val!;
                                          },
                                          onFieldSubmitted: (val) {},
                                          keyboardType: TextInputType.datetime,
                                          controller: joinController,
                                          decoration: InputDecoration(
                                            hintText: "DD/MM/YYYY",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Date Exit',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return 'Enter Your Ending Date ...';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            MyUtil.myExitDate = val!;
                                          },
                                          onFieldSubmitted: (val) {},
                                          keyboardType: TextInputType.datetime,
                                          decoration: InputDecoration(
                                            hintText: "DD/MM/YYYY",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Date Joined',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return 'Enter Your Joining Date ...';
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            MyUtil.myJoinDate = val!;
                                          },
                                          controller: joinController,
                                          onFieldSubmitted: (val) {},
                                          keyboardType: TextInputType.datetime,
                                          decoration: InputDecoration(
                                            hintText: "DD/MM/YYYY",
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13),
                              child: Container(
                                height: 50,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    globalKey.currentState!.reset();

                                    comNameController.clear();
                                    sCIController.clear();
                                    rolesController.clear();
                                    joinController.clear();
                                    endController.clear();

                                    MyUtil.myComName = '';
                                    MyUtil.mySCI = '';
                                    MyUtil.myRoles = '';
                                    MyUtil.myJoinDate = '';
                                    MyUtil.myExitDate = '';

                                    setState(() {});
                                  },
                                  child: const Text(
                                    "Clear",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (globalKey.currentState!.validate()) {
                                    globalKey.currentState!.save();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Saves done....'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.of(context)
                                        .pushNamed('work_space');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
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
        ],
      ),
    );
  }
}
