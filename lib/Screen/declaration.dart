// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:resumes_1/data/util.dart';

class declaration extends StatefulWidget {
  const declaration({super.key});

  @override
  State<declaration> createState() => _declarationState();
}

class _declarationState extends State<declaration> {
  String genderVal = '';
  bool switchVal = false;

  TextEditingController declController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  GlobalKey<FormState> MyUtilKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 23,
                ),
                child: Center(
                  child: Text(
                    "Declaration",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
            Form(
              key: MyUtilKey,
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 520,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Declaration",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20),
                            ),
                            Switch(
                              value: switchVal,
                              onChanged: (val) {
                                setState(() {
                                  switchVal = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: (switchVal)
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "img/t1.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Add Description ...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        MyUtil.myDeclarationDesc = val!;
                                      },
                                      onFieldSubmitted: (val) {},
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "Description",
                                          border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 1))),
                                    ),
                                    SizedBox(height: 20),
                                    Container(height: 1, color: Colors.black38),
                                    SizedBox(height: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Date",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(height: 20),
                                              TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Enter Date ...';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (val) {
                                                  MyUtil.myDateDecl = val!;
                                                },
                                                onFieldSubmitted: (val) {},
                                                controller: dateController,
                                                keyboardType:
                                                    TextInputType.datetime,
                                                decoration: InputDecoration(
                                                    hintText: "DD/MM/YYYY",
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Place(Interview venue/city)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(height: 10),
                                              TextFormField(
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Enter Place ...';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (val) {
                                                  MyUtil.myPlaceIntCity = val!;
                                                },
                                                onFieldSubmitted: (val) {},
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                    hintText: "Eg. Surat",
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              MyUtilKey.currentState!.reset();

                                              declController.clear();
                                              dateController.clear();
                                              placeController.clear();

                                              MyUtil.myDeclarationDesc = '';
                                              MyUtil.myDateDecl = '';
                                              MyUtil.myPlaceIntCity = '';

                                              setState(() {});
                                            },
                                            child: const Text(
                                              "Clear",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (MyUtilKey.currentState!
                                                  .validate()) {
                                                MyUtilKey.currentState!.save();

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    content:
                                                        Text('Saves done....'),
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                );
                                                Navigator.of(context)
                                                    .pushNamed('resume');
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    content: Text(
                                                        'Please fill all Fields..'),
                                                    backgroundColor:
                                                        Colors.deepOrangeAccent,
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text(
                                              "Save ",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
