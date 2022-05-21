import 'package:flutter/material.dart';
import 'package:heapp/constants.dart';

AppBar mainHeader(Size size) {
  return AppBar(
    elevation: 0,
    shadowColor: null,
    toolbarOpacity: 0,
    bottomOpacity: 0,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      color: Colors.lime[100],
      width: size.width,
      height: size.height * 0.07,
      child: Center(
        child: Container(
          color: Colors.lime[100],
          child: Text(
            "Heapp",
            style: TextStyle(
              color: kTitleColor,
              fontFamily: 'Comic Sans',
              fontSize: size.height * 0.035,
              backgroundColor: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
