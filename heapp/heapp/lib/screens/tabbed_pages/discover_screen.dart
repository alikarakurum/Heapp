import 'package:flutter/material.dart';
import 'package:heapp/screens/directed_pages/smart_finder.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<String> doctorInterdisciplinary = [
    "Orthopedy",
    "Brain Surgery",
    "Kardiovasküler"
  ];
  List<String> healthCorpType = ["PHARMACY", "HOSPITAL", "CLINIC"];
  int horizontalListInterdisciplinaryIndex;
  int horizontalListCorporationIndex;
  String interDisciplinaryName;
  String corporationName;

  @override
  void initState() {
    super.initState();
    horizontalListInterdisciplinaryIndex = 0;
    horizontalListCorporationIndex = 0;
    interDisciplinaryName =
        doctorInterdisciplinary[horizontalListInterdisciplinaryIndex];
    corporationName = healthCorpType[horizontalListCorporationIndex];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: size.height * 0.03),
            height: size.height * 0.1,
            width: size.width * 0.7,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.height * 0.03),
                  bottomRight: Radius.circular(size.height * 0.03)),
            ),
            child: Text(
              "HECOA",
              style: TextStyle(
                  fontSize: size.height * 0.04,
                  fontFamily: 'CommercialScript BT',
                  fontWeight: FontWeight.bold),
            ),
          ),
          buildSmartFinderBox(size),
          buildSearchHealthWritings(size),
          buildPanelForSearchings(size),
          SizedBox(
            height: size.height * 0.1,
          ),
        ],
      ),
    );
  }

  buildPanelForSearchings(Size size) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.lime[200],
          borderRadius: BorderRadius.circular(size.width * 0.03)),
      margin: EdgeInsets.only(top: size.width * 0.03),
      height: size.height * 0.7,
      width: size.width * 0.9,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.68,
            width: size.width * 0.37,
            decoration: BoxDecoration(
                color: Colors.brown[400],
                borderRadius: BorderRadius.circular(size.width * 0.022)),
            margin: EdgeInsets.all(size.width * 0.01),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildListBox(size, whichBox: "healthActivity"),
                  buildListBox(size, whichBox: "drugAndPills"),
                  buildListBox(size, whichBox: "food"),
                ]),
          ),
          Container(
            height: size.height * 0.68,
            width: size.width * 0.485,
            margin: EdgeInsets.all(size.width * 0.01),
            child: Column(
              children: [
                buildHorizontalCategoryListForDoctors(size, "TOP DOCTORS"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                buildHorizontalCategoryListForPlaces(size, "PHARMACIES"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildHorizontalCategoryListForDoctors(Size size, String title) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(size.width * 0.01),
          height: size.height * 0.05,
          width: size.width * 0.47,
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                fontSize: size.height * 0.02,
                fontFamily: 'CommercialScript BT'),
          ),
        ),
        Container(
          height: size.height * 0.25,
          width: size.width * 0.47,
          decoration: BoxDecoration(
              color: Colors.brown[500],
              borderRadius: BorderRadius.circular(size.width * 0.022)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0.01),
                height: size.height * 0.04,
                width: size.width * 0.47,
                decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_left),
                      onTap: () {
                        setState(() {
                          horizontalListInterdisciplinaryIndex -= 1;
                        });

                        if (horizontalListInterdisciplinaryIndex < 0) {
                          setState(() {
                            horizontalListInterdisciplinaryIndex = 2;
                          });
                        }
                        setState(() {
                          interDisciplinaryName = doctorInterdisciplinary[
                              horizontalListInterdisciplinaryIndex];
                        });
                      },
                    ),
                    Text(interDisciplinaryName),
                    GestureDetector(
                      child: Icon(Icons.arrow_right),
                      onTap: () {
                        setState(() {
                          horizontalListInterdisciplinaryIndex += 1;
                        });

                        if (horizontalListInterdisciplinaryIndex > 2) {
                          setState(() {
                            horizontalListInterdisciplinaryIndex = 0;
                          });
                        }
                        setState(() {
                          interDisciplinaryName = doctorInterdisciplinary[
                              horizontalListInterdisciplinaryIndex];
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(size.height * 0.01),
                alignment: Alignment.center,
                height: size.height * 0.185,
                width: size.width * 0.47,
                decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: BorderRadius.circular(size.width * 0.001)),
                child: Center(
                    child: GridView.count(
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  scrollDirection: Axis.horizontal,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  children: List.generate(7, (index) {
                    return Container(
                      alignment: Alignment.center,
                      height: size.height * 0.18,
                      width: size.width * 8,
                      decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius:
                              BorderRadius.circular(size.width * 0.01)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.person,
                            size: size.height * 0.07,
                          ),
                          Text((index + 1).toString())
                        ],
                      ),
                    );
                  }),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildHorizontalCategoryListForPlaces(Size size, String title) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(size.width * 0.01),
          height: size.height * 0.05,
          width: size.width * 0.47,
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                fontSize: size.height * 0.02,
                fontFamily: 'CommercialScript BT'),
          ),
        ),
        Container(
          height: size.height * 0.25,
          width: size.width * 0.47,
          decoration: BoxDecoration(
              color: Colors.brown[500],
              borderRadius: BorderRadius.circular(size.width * 0.022)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0.01),
                height: size.height * 0.04,
                width: size.width * 0.47,
                decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      key: ValueKey(2),
                      child: Icon(Icons.arrow_left),
                      onTap: () {
                        setState(() {
                          horizontalListCorporationIndex -= 1;
                        });

                        if (horizontalListCorporationIndex < 0) {
                          setState(() {
                            horizontalListCorporationIndex = 2;
                          });
                        }
                        setState(() {
                          corporationName =
                              healthCorpType[horizontalListCorporationIndex];
                        });
                      },
                    ),
                    Text(corporationName),
                    GestureDetector(
                      child: Icon(Icons.arrow_right),
                      onTap: () {
                        setState(() {
                          horizontalListCorporationIndex += 1;
                        });

                        if (horizontalListCorporationIndex > 2) {
                          setState(() {
                            horizontalListCorporationIndex = 0;
                          });
                        }
                        setState(() {
                          corporationName =
                              healthCorpType[horizontalListCorporationIndex];
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(size.height * 0.01),
                alignment: Alignment.center,
                height: size.height * 0.185,
                width: size.width * 0.47,
                decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: BorderRadius.circular(size.width * 0.001)),
                child: Center(
                    child: GridView.count(
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  scrollDirection: Axis.horizontal,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  children: List.generate(7, (index) {
                    return Container(
                      alignment: Alignment.center,
                      height: size.height * 0.18,
                      width: size.width * 8,
                      decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius:
                              BorderRadius.circular(size.width * 0.01)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.house,
                            size: size.height * 0.07,
                          ),
                          Text((index + 1).toString())
                        ],
                      ),
                    );
                  }),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildListBox(Size size,
      {double topMargin = 0.01,
      double bottomMargin = 0,
      Function onTap,
      String whichBox}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: size.width * topMargin,
            left: size.width * 0.01,
            right: size.width * 0.01,
            bottom: bottomMargin),
        height: size.height * 0.2135,
        width: size.width * 0.48,
        decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: BorderRadius.circular(size.width * 0.022)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            whichBox == "healthActivity"
                ? Icon(
                    Icons.bike_scooter,
                    size: size.height * 0.05,
                  )
                : whichBox == "drugAndPills"
                    ? Icon(
                        Icons.drag_handle_outlined,
                        size: size.height * 0.05,
                      )
                    : whichBox == "food"
                        ? Icon(
                            Icons.food_bank,
                            size: size.height * 0.05,
                          )
                        : Icon(
                            Icons.access_alarm,
                            size: size.height * 0.05,
                          ),
            whichBox == "healthActivity"
                ? Text(
                    "Activities",
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CommercialScript BT'),
                  )
                : whichBox == "drugAndPills"
                    ? Text(
                        "Drug And Pills",
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CommercialScript BT'),
                      )
                    : whichBox == "food"
                        ? Text(
                            "Foods",
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CommercialScript BT'),
                          )
                        : Text(
                            "Search",
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CommercialScript BT'),
                          )
          ],
        ),
      ),
    );
  }

  buildSearchHealthWritings(Size size) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lime[200],
          borderRadius: BorderRadius.circular(size.width * 0.03)),
      margin: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.05,
          right: size.width * 0.05),
      height: size.height * 0.35,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(size.width * 0.01),
            decoration: BoxDecoration(
                color: Colors.brown[100],
                borderRadius: BorderRadius.circular(size.width * 0.022)),
            height: size.height * 0.334,
            width: size.width * 0.61,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(size.width * 0.022)),
                  height: size.height * 0.1,
                  width: size.width * 0.60,
                  child: Text(
                    "About Health",
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontFamily: 'CommercialScript BT'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.005, bottom: size.height * 0.003),
                  decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(size.width * 0.022)),
                  height: size.height * 0.226,
                  width: size.width * 0.60,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius:
                            BorderRadius.circular(size.width * 0.022)),
                    child: Container(
                      height: size.height * 0.220,
                      margin: EdgeInsets.all(size.height * 0.006),
                      child: ListView.builder(
                        padding: EdgeInsets.all(size.width * 0.003),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(index.toString()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("SEARCH HEALTH ISSUES TAP");
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.lime[500],
                  borderRadius: BorderRadius.circular(size.width * 0.022)),
              margin: EdgeInsets.only(
                  top: size.height * 0.008,
                  left: size.width * 0.002,
                  bottom: size.height * 0.008,
                  right: size.height * 0.008),
              width: size.width * 0.25,
              height: size.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.favorite,
                    size: size.height * 0.07,
                    color: Colors.white,
                  ),
                  Text(
                    "SEARCH FOR HEALTH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.02,
                        fontFamily: 'CommercialScript BT'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildSmartFinderBox(Size size) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.03,
              left: size.width * 0.10,
              right: size.width * 0.10),
          height: size.height * 0.05,
          alignment: Alignment.centerLeft,
          child: Text(
            "Do You Feel Sick ? ",
            style: TextStyle(
                fontSize: size.height * 0.03,
                fontFamily: 'CommercialScript BT'),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SmartFinder()));
          },
          child: Container(
            margin: EdgeInsets.only(
              top: size.height * 0.01,
            ),
            height: size.height * 0.2,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(size.width * 0.03)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Smart Ilness Finder",
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontFamily: 'CommercialScript BT'),
                  ),
                  Icon(
                    Icons.search,
                    size: size.width * 0.12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
