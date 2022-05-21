import 'package:flutter/material.dart';
import 'package:heapp/screens/tabbed_pages/discover_screen.dart';
import 'package:heapp/screens/tabbed_pages/main_screen.dart';
import 'package:heapp/screens/tabbed_pages/personal_screen.dart';

class HeappHomeScreen extends StatefulWidget {
  @override
  _HeappHomeScreenState createState() => _HeappHomeScreenState();
}

class _HeappHomeScreenState extends State<HeappHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      vsync: this,
      length: 3,
    );
    _currentIndex = _tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                DiscoverScreen(),
                MainUsageScreen(),
                PersonProfile(),
              ],
            ),
            Positioned(
              child: heappBottomBar(context, size),
              bottom: size.height * 0.005,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  heappBottomBar(BuildContext context, Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.07,
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.025),
            color: Colors.limeAccent[700]),
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: size.width * 0.01,
            right: size.width * 0.01,
            bottom: size.width * 0.005,
            top: size.width * 0.001),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                  _tabController.animateTo(_currentIndex);
                });
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.45,
                alignment: Alignment.center,
                child: Icon(
                  Icons.emoji_people_outlined,
                  color: _currentIndex == 0 &&
                          _currentIndex != 1 &&
                          _currentIndex != 2
                      ? Colors.brown[400]
                      : Colors.white,
                  size: size.width * 0.05,
                ),
                //edit_location_outlined
                //filter_tilt_shift_outlined
                //language_rounded
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                    _tabController.animateTo(_currentIndex);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.10,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.lime),
                  child: Icon(
                    Icons.favorite,
                    color: _currentIndex == 1 &&
                            _currentIndex != 0 &&
                            _currentIndex != 2
                        ? Colors.red
                        : Colors.white,
                    size: size.width * 0.05,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                  _tabController.animateTo(_currentIndex);
                });
              },
              child: Container(
                height: size.height * 0.08,
                width: size.width * 0.45,
                alignment: Alignment.center,
                child: Icon(
                  Icons.person_pin,
                  color: _currentIndex == 2 &&
                          _currentIndex != 0 &&
                          _currentIndex != 1
                      ? Colors.brown[400]
                      : Colors.white,
                  size: size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
