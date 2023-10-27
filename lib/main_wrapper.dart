import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:clothing_market/screens/home.dart';
import 'package:clothing_market/screens/search.dart';
import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final int _index = 0;
  bool isSearchActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: isSearchActive
            ? FadeIn(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            : FadeIn(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  "home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: isSearchActive
                ? Icon(
                    LineIcons.searchMinus,
                    color: Colors.black,
                    size: 30,
                  )
                : Icon(
                    LineIcons.search,
                    color: Colors.black,
                    size: 30,
                  ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: isSearchActive ? Search() : Home(),
      bottomNavigationBar: BottomBarBubble(
        selectedIndex: _index,
        color: primaryColor,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.email),
        ],
        onSelect: (index) {},
      ),
    );
  }
}
