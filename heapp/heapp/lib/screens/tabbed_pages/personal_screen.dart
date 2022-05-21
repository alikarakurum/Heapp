import 'package:flutter/material.dart';

class PersonProfile extends StatefulWidget {
  @override
  _PersonProfileState createState() => _PersonProfileState();
}

class _PersonProfileState extends State<PersonProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              buildProfileHeader(size),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height * 0.02),
                  color: Colors.lime[100],
                ),
                margin: EdgeInsets.symmetric(
                  vertical: size.width * 0.006,
                  horizontal: size.width * 0.01,
                ),
                width: size.width * 0.97,
                height: size.height * 0.65,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(size.width * 0.008),
                  child: Column(
                    children: [
                      buildDailyActivityButton(size),
                      buildRowOfFoodAndPatient(size),
                      buildDailyFollowAndMedicinesRow(size),
                      buildHistoryAndSexualHealthRow(size),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildHistoryAndSexualHealthRow(Size size) {
    return Container(
      margin: EdgeInsets.all(size.width * 0.01),
      width: size.width * 0.95,
      height: size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.01),
            width: size.width * 0.3,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.015),
              color: Colors.pink[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.surround_sound,
                  size: size.height * 0.07,
                ),
                Text(
                  "Sexual Health",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.62,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.015),
              color: Colors.brown[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.local_hospital,
                  size: size.height * 0.07,
                ),
                Text(
                  "Visit History",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildDailyFollowAndMedicinesRow(Size size) {
    return Container(
      margin: EdgeInsets.all(size.width * 0.01),
      width: size.width * 0.95,
      height: size.height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.01),
            width: size.width * 0.62,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.015),
              color: Colors.orange[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.dynamic_feed,
                  size: size.height * 0.07,
                ),
                Text(
                  "Daily Follow-Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.30,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.015),
              color: Colors.purple[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.medical_services,
                  size: size.height * 0.07,
                ),
                Text(
                  "Medicines",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildRowOfFoodAndPatient(Size size) {
    return Container(
      margin: EdgeInsets.all(size.width * 0.01),
      width: size.width * 0.95,
      height: size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: size.width * 0.01),
            width: size.width * 0.46,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.015),
              color: Colors.yellow[300],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.branding_watermark_rounded,
                  size: size.height * 0.07,
                ),
                Text(
                  "Nutrition Follow-Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.46,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.015),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.ac_unit_sharp,
                  size: size.height * 0.07,
                ),
                Text(
                  "Patient & Sensitivity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildDailyActivityButton(Size size) {
    return Container(
      margin: EdgeInsets.all(size.width * 0.01),
      width: size.width * 0.95,
      height: size.height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.015),
        color: Colors.green[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add_circle_outline_rounded,
            size: size.height * 0.08,
          ),
          Text(
            "Your Daily Activity",
            style: TextStyle(
                fontSize: size.height * 0.033, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildProfileHeader(Size size) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.02),
        color: Colors.brown[300],
      ),
      height: size.height * 0.22,
      width: size.width * 0.984,
      margin: EdgeInsets.all(size.width * 0.015),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.23,
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.025, horizontal: size.height * 0.02),
            decoration: BoxDecoration(
                color: Colors.orange[200], shape: BoxShape.circle),
            child: Icon(
              Icons.person,
              size: size.height * 0.15,
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: size.height * 0.04,
                width: size.width * 0.5,
                margin: EdgeInsets.only(
                    top: size.height * 0.05, left: size.height * 0.02),
                child: Text(
                  "Ali Karakurum",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.022,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(size.height * 0.08)),
                  height: size.height * 0.04,
                  width: size.width * 0.5,
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  child: Text(
                    "Your Personal Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
