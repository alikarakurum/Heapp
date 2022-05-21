import 'package:flutter/material.dart';

class DrugsAndMedicinesScrollPage extends StatefulWidget {
  @override
  _DrugsAndMedicinesScrollPageState createState() =>
      _DrugsAndMedicinesScrollPageState();
}

class _DrugsAndMedicinesScrollPageState
    extends State<DrugsAndMedicinesScrollPage> {
  ScrollController _scrollController;
  bool isCardChoosen;

  @override
  void initState() {
    super.initState();
    isCardChoosen = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height * 0.03),
              ),
              alignment: Alignment.center,
              height: size.height * 0.98,
              width: size.width * 0.98,
              margin: EdgeInsets.all(size.height * 0.01),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    title: Text('SliverAppBar'),
                    backgroundColor: Colors.green,
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                          Image.asset('assets/forest.jpg', fit: BoxFit.cover),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return new Container(
                          alignment: Alignment.center,
                          height: size.height * 0.03,
                          width: size.width * 0.96,
                          child: new Text('grid item $index'),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(size.height * 0.01),
                                topRight: Radius.circular(size.height * 0.03)),
                            color: Colors.teal[100 * index],
                          ),
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  makeHeader(Size size) {
    return Container(
      child: SliverAppBar(
        title: Text(
          "Your Drugs & Medicines",
          style: TextStyle(
              fontSize: size.height * 0.01,
              fontFamily: "Calibri",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: size.height * 0.04,
        collapsedHeight: size.height * 0.05,
        expandedHeight: size.height * 0.1,
      ),
    );
  }
}
