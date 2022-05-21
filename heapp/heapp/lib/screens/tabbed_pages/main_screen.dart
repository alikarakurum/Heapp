import 'package:flutter/material.dart';
import 'package:heapp/screens/directed_pages/drugs_medicines_scroll_view.dart';

class MainUsageScreen extends StatefulWidget {
  @override
  _MainUsageScreenState createState() => _MainUsageScreenState();
}

class _MainUsageScreenState extends State<MainUsageScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width * 0.8,
              height: size.height * 0.35,
              margin: EdgeInsets.all(size.height * 0.001),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height * 0.03),
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.favorite,
                    size: size.height * 0.15,
                  ),
                  Text(
                    "Life Record",
                    style: TextStyle(
                        fontSize: size.height * 0.05,
                        fontFamily: 'CommercialScript BT',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DrugsAndMedicinesScrollPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.5,
                    height: size.height * 0.37,
                    margin: EdgeInsets.all(size.height * 0.002),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height * 0.03),
                      color: Colors.brown[200],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.search,
                          size: size.height * 0.13,
                        ),
                        Text(
                          "Smart Finder",
                          style: TextStyle(
                              fontSize: size.height * 0.03,
                              fontFamily: 'CommercialScript BT',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.296,
                  height: size.height * 0.37,
                  margin: EdgeInsets.all(size.height * 0.002),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.03),
                    color: Colors.green[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.drafts,
                        size: size.height * 0.13,
                      ),
                      Text(
                        "Health ID",
                        style: TextStyle(
                            fontSize: size.height * 0.03,
                            fontFamily: 'CommercialScript BT',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
