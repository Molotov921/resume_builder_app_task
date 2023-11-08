// ignore_for_file: camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:resumes_1/data/util.dart';

class Personal_Details extends StatefulWidget {
  const Personal_Details({Key? key});

  @override
  _Personal_DetailsState createState() => _Personal_DetailsState();
}

class _Personal_DetailsState extends State<Personal_Details> {
  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

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
              // Place the Expanded widget inside a Row
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
                    'Personal Details',
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
              alignment: Alignment.topCenter,
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Form(
                    key: globalKey,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'DOB',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Name ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              MyUtil.myDob = val!;
                            },
                            controller: dobController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                hintText: "DD/MM/YYYY",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          Text(
                            'Marital Status',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          // Radio Button .........
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text('Single'),
                                  value: 'Single',
                                  groupValue: MyUtil.myMaritalStatus,
                                  onChanged: (val) {
                                    setState(() {
                                      MyUtil.myMaritalStatus = val!;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text('Married'),
                                  value: 'Married',
                                  groupValue: MyUtil.myMaritalStatus,
                                  onChanged: (val) {
                                    setState(() {
                                      MyUtil.myMaritalStatus = val!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Languages Known',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          const SizedBox(height: 20),
                          ...MyUtil.myLangKnown.map((e) {
                            return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('${e['langName']}'),
                              value: e['isSelect'],
                              onChanged: (val) {
                                setState(() {
                                  e['isSelect'] = val;
                                });
                              },
                            );
                          }),
                          Text(
                            'Nationality',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter Your Nationality ...';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              MyUtil.myNationality = val!;
                            },
                            controller: nationalityController,
                            decoration: InputDecoration(
                                hintText: "Indian",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    globalKey.currentState!.reset();
                                    dobController.clear();
                                    nationalityController.clear();
                                    MyUtil.myDob = '';
                                    MyUtil.myNationality = '';
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(fontSize: 25),
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text('Saves done....'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Navigator.of(context)
                                          .pushNamed('work_space');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content:
                                              Text('Please fill all Fields...'),
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
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
