import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heapp/models/medicine.dart';

class DrugsAndMedicinesScrollPage extends StatefulWidget {
  @override
  _DrugsAndMedicinesScrollPageState createState() =>
      _DrugsAndMedicinesScrollPageState();
}

class _DrugsAndMedicinesScrollPageState
    extends State<DrugsAndMedicinesScrollPage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Medicine> medicinesOfUser = [];
  List<Color> medicineColorFromIndex = [
    Colors.blue[300],
    Colors.orange[300],
    Colors.yellow[500]
  ];

  void getMedicinesData() {
    List<Medicine> responseList = [];
    for (int i = 0; i <= 12; i += 1) {
      if (i % 2 == 0) {
        Medicine medicine = Medicine.returner();
        responseList.add(medicine);
      } else {
        Medicine medicine = Medicine.returner2();
        responseList.add(medicine);
      }
    }
    setState(() {
      medicinesOfUser = responseList;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    getMedicinesData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  buildMedicinePackages(Size size, Medicine medicine, int index) {
    return Container(
        height: size.height * 0.22,
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.width * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05)),
            color: index == 0
                ? Colors.blue[100]
                : index == 3
                    ? Colors.brown[300]
                    : Colors.purple[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: size.width * 0.01),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02, vertical: size.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.width * 0.01),
                    child: Icon(
                      Icons.circle,
                      size: size.height * 0.09,
                      color: medicineColorFromIndex[index],
                    ),
                  ),
                ],
              ),
              Container(
                width: size.width * 0.5,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      medicine.name,
                      style: TextStyle(
                          fontSize: size.width * 0.09,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      medicine.type,
                      style: TextStyle(
                          fontSize: size.width * 0.07, color: Colors.grey),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      debugPrint(medicine.type + "\nFUNCTION_BUTTON");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: size.width * 0.01),
                      width: size.width * 0.15,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.05)),
                        color: Colors.lime[200],
                      ),
                      child: Icon(
                        Icons.collections_bookmark,
                        color: Colors.red[300],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange[50],
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.01,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 170),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: medicinesOfUser.length,
                      physics: CustomScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return GestureDetector(
                          onTap: () {
                            debugPrint(medicinesOfUser[index].name);
                          },
                          child: Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: buildMedicinePackages(
                                    size,
                                    medicinesOfUser[index],
                                    medicinesOfUser[index].medicineColorIndex),
                              ),
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.15;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: size.width * 0.4,
                margin: EdgeInsets.only(right: size.height * 0.01),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Add\nMedicines",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width * 0.4,
                margin: EdgeInsets.only(right: size.height * 0.01),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Edit\nMedicines",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.4,
                margin: EdgeInsets.only(right: size.height * 0.01),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Medicines\nHistory",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
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
}

// List<Widget> listItems = [];
//     responseList.forEach((medicine) {
//       listItems.add(Container(
//           height: 130,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               color: Colors.blue[100],
//               boxShadow: [
//                 BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//               ]),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       medicine.name,
//                       style: const TextStyle(
//                           fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       medicine.type,
//                       style: const TextStyle(fontSize: 17, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )));
//     });
//     setState(() {
//       itemsData = listItems;
//     });

class CustomScrollPhysics extends BouncingScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  double get maxFlingVelocity => 300;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }
}
