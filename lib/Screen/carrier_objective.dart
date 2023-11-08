// ignore_for_file: camel_case_types, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../data/util.dart';

class Carrier_Objective extends StatefulWidget {
  const Carrier_Objective({Key? key});

  @override
  _Carrier_ObjectiveState createState() => _Carrier_ObjectiveState();
}

class _Carrier_ObjectiveState extends State<Carrier_Objective> {
  TextEditingController descController = TextEditingController();
  TextEditingController currentDesignationC = TextEditingController();
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
                    'Carrier Objective',
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
            // Placed Expanded here
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Career Objective",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Career Objective ..............................
                                TextFormField(
                                  controller: descController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Career Objective...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    MyUtil.myCareerObj = val!;
                                  },
                                  onFieldSubmitted: (val) {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Description',
                                  ),
                                  maxLines: 7,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Current Designation (Experienced Candidate)",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: currentDesignationC,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Your Address(state name and Pin code)...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    MyUtil.myCurrentDesignation = val!;
                                  },
                                  onFieldSubmitted: (val) {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 50,
                                      ),
                                    ),
                                    hintText: 'Software Engineer',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          globalKey.currentState!.reset();

                                          descController.clear();
                                          currentDesignationC.clear();

                                          MyUtil.myCareerObj = '';
                                          MyUtil.myCurrentDesignation = '';
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
                                          if (globalKey.currentState!
                                              .validate()) {
                                            globalKey.currentState!.save();

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                behavior:
                                                    SnackBarBehavior.floating,
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
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(
                                                    'Please fill all Fields...'),
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
                    ],
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
