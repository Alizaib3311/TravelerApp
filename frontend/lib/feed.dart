import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/profile.dart';
import 'custom_trip.dart';
import 'detailed_trip_view.dart';
import 'tripDesc.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'custom_trip.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyFeed extends StatefulWidget {
  const MyFeed({Key? key}) : super(key: key);
  @override
  _MyFeedState createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  final List<tripDesc> tripList = [
    tripDesc(
        "Mushkpuri",
        DateTime.now(),
        DateTime.now(),
        2800,
        "Daewoo",
        "https://www.chalchalen.com/images/event/5f86faf697414-one-day-trekking-trip-to-mushkpuri-top-the-monal.png?v=1602681590",
        "day 1 \n"
            "lahore to Nathia Gali\n"
            "day 2 \n"
            "hiking day \n"
            "day three \n"
            "return Lahore\n"),
    tripDesc(
        "Murree",
        DateTime.now(),
        DateTime.now(),
        3000,
        "Daewoo",
        "https://i.tribune.com.pk/media/images/545461-murreeinp-1367907090/545461-murreeinp-1367907090.jpg",
        "day 1 \n"
            "lahore to Murree\n"
            "day 2 \n"
            "hiking day \n"
            "day three \n"
            "return Lahore\n"),
    tripDesc(
        "Kalaam",
        DateTime.now(),
        DateTime.now(),
        15000,
        "Daewoo",
        "https://i.pinimg.com/originals/d9/45/c0/d945c07bcdee5f9ee74eed822258d197.jpg",
        "day 1\n "
            "lahore to Kalaam\n"
            "day 2 \n"
            "hiking day\n "
            "day three \n"
            "return Lahore\n"),
    tripDesc(
        "Sawat",
        DateTime.now(),
        DateTime.now(),
        10000,
        "Daewoo",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVGdsggO9WelbDFjZhnPEuz_edaj_6cnVuP91N05EdDKGP9p2s-xuZw49KtXGuF3kIrQE&usqp=CAU",
        "day 1\n "
            "lahore to Sawat\n"
            "day 2 \n"
            "hiking day\n "
            "day three\n "
            "return Lahore\n"),
    tripDesc(
        "Kaghan",
        DateTime.now(),
        DateTime.now(),
        13500,
        "Daewoo",
        "https://cdn.tourismontheedge.com/wp-content/uploads/2010/07/1_8_KaghanValley.jpg",
        " "),
    tripDesc(
        "Fairy Meadows",
        DateTime.now(),
        DateTime.now(),
        25000,
        "Daewoo",
        "https://rac.com.pk/wp-content/uploads/2021/02/Fairy_Meadows_Tour-scaled-1.jpg",
        ""),
    tripDesc(
        "Nathia Gali",
        DateTime.now(),
        DateTime.now(),
        8000,
        "Daewoo",
        "https://www.ktownrooms.com/public/uploads/website/blog/visit-nathia-gali/weather-at-nathia-gali.jpg",
        "")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Traveler'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            // feed
            child: new ListView.builder(
                itemCount: tripList.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildTripCard(context, index)),
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
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize),
              label: 'Custom Trip',
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

  Widget build_customtrip(BuildContext context) {
    return new DateRanges();
  }

  Widget build_Profile(BuildContext context) {
    return new Myprofile();
  }

// feed code
  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripList[index];
    return new Container(
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: NetworkImage(trip.Photo_reference),
                //       fit: BoxFit.fitWidth,
                //       alignment: Alignment.topCenter,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Text(
                      trip.title,
                      style: new TextStyle(fontSize: 30.0),
                    ),
                    Spacer()
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 30.0),
                  child: Row(children: <Widget>[
                    Text(
                        "${DateFormat('dd/mm/yyy').format(trip.startDate).toString()}-${DateFormat('dd/mm/yyy').format(trip.endDate).toString()}"),
                    Spacer()
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "\Rs ${trip.Budget.toStringAsFixed(2)}",
                        style: new TextStyle(fontSize: 30),
                      ),
                      Spacer(),
                      Text(trip.travelType)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                  child: Row(children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyFeed()),
                          );
                        },
                        child: const Text('Book'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          minimumSize: const Size(100, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    Spacer()
                  ]),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailTrip(trip: trip)));
          },
        ),
      ),
    );
  }
}
//CUSTOM TRIP
