import 'package:flutter/material.dart';

class HeappBottomBar extends StatefulWidget {
  final TabController tabBarController;
  final BuildContext context;
  final Size size;
  HeappBottomBar(this.context, this.size, this.tabBarController);

  @override
  _HeappBottomBarState createState() => _HeappBottomBarState();
}

class _HeappBottomBarState extends State<HeappBottomBar> {
  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      height: widget.size.height * 0.08,
      width: widget.size.width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size.width * 0.003),
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: widget.size.width * 0.001,
            right: widget.size.width * 0.001,
            bottom: widget.size.width * 0.002,
            top: widget.size.width * 0.001),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                height: widget.size.height * 0.08,
                alignment: Alignment.center,
                child: Icon(
                  Icons.emoji_people_outlined,
                  color: Colors.lime,
                ),
                //edit_location_outlined
                //filter_tilt_shift_outlined
                //language_rounded
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: widget.size.height * 0.08,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.lime),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: widget.size.height * 0.08,
              alignment: Alignment.center,
              child: Icon(
                Icons.person_pin,
                color: Colors.lime,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
