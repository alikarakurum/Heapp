import 'package:flutter/material.dart';
import 'package:heapp/widgets/input_field_customizing.dart';

class SmartFinder extends StatefulWidget {
  @override
  _SmartFinderState createState() => _SmartFinderState();
}

class _SmartFinderState extends State<SmartFinder> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                buildAppBarOfSmartFinder(size),
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.98,
                  margin: EdgeInsets.all(size.height * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.02),
                    color: Colors.orange[50],
                  ),
                  child: Column(
                    children: [
                      buildSearchTextFieldBar(size),
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.6,
                        width: size.width * 0.98,
                        margin: EdgeInsets.all(size.height * 0.01),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.02),
                          color: Colors.brown[50],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildSearchingHintResults(size, "message")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildQuestion() {}
  buildMessage() {}

  buildSearchingHintResults(Size size, String message) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.56,
      width: size.width * 0.96,
      margin: EdgeInsets.all(size.height * 0.005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.04),
      ),
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
    );
  }

  buildSearchTextFieldBar(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.08,
      width: size.width * 0.98,
      margin: EdgeInsets.all(size.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height * 0.02),
        color: Colors.purple[50],
      ),
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.06,
        width: size.width * 0.92,
        margin: EdgeInsets.all(size.height * 0.012),
        child: TextFormField(
          controller: _textEditingController,
          decoration: DecorationSpecific().textFieldStyle(
              size: size,
              hintText: "Write Symptoms",
              suffixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }

  buildAppBarOfSmartFinder(Size size) {
    return Column(
      children: [
        Container(
          height: size.height * 0.07,
          width: size.width * 0.98,
          margin: EdgeInsets.only(
              top: size.height * 0.01,
              left: size.height * 0.01,
              right: size.height * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height * 0.02),
            color: Colors.lime[300],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.1,
                  width: size.width * 0.1,
                  margin: EdgeInsets.all(size.height * 0.01),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[100],
                  ),
                  child: Icon(
                    Icons.arrow_left,
                    size: size.height * 0.05,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.07,
                width: size.width * 0.75,
                margin: EdgeInsets.symmetric(
                    horizontal: size.height * 0.006,
                    vertical: size.height * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height * 0.02),
                  color: Colors.lime[100],
                ),
                child: Text(
                  "Smart Finder",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.03,
                      fontFamily: 'CommercialScript BT'),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: size.height * 0.1,
          width: size.width * 0.9,
          margin: EdgeInsets.symmetric(horizontal: size.height * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.height * 0.03),
                bottomRight: Radius.circular(size.height * 0.03)),
            color: Colors.brown[100],
          ),
          child: Text(
            "Arama çubuğuna hissettiğin rahatsızlığı yaz..",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02,
                fontFamily: 'CommercialScript BT'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }
}

// Text(
//         message,
//         style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: size.height * 0.04,
//             fontFamily: 'CommercialScript BT'),
//       ),
