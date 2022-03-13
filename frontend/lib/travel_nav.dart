import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/add_trip.dart';
import 'package:frontend/profile.dart';
import 'custom_trip.dart';
import 'detailed_trip_view.dart';
import 'tripDesc.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'custom_trip.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyTravel extends StatefulWidget {
  const MyTravel({Key? key}) : super(key: key);
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyTravel> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Travel Agency'),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            // feed
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return build_Addtrip(context);
              },
            ),
          ),

          //custom trip
          Container(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return build_customtrip(context);
              },
            ),
          ),
          //profile
          Container(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return build_Notification(context);
              },
            ),
          ),
          Container(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return build_Profile(context);
              },
            ),
          ),
        ],
        //   child: new ListView.builder(
        //       itemCount: tripList.length,
        //       itemBuilder: (BuildContext context, int index) =>
        //           buildTripCard(context, index)),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add Trip',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize),
              label: 'Custom Trip Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          onTap: onTapped),
    );
  }

  Widget build_Addtrip(BuildContext context) {
    return new MyTripAdd();
  }

  Widget build_customtrip(BuildContext context) {
    return new DateRanges();
  }

  Widget build_Notification(BuildContext context) {
    return new Container();
  }

  Widget build_Profile(BuildContext context) {
    return new Myprofile();
  }

  // Widget build_customtrip(BuildContext context) {
  //   return new DateRanges();
  // }
  //
  // Widget build_Profile(BuildContext context) {
  //   return new Myprofile();
  // }
}
