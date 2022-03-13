import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/tripDesc.dart';
import 'package:intl/intl.dart';

import 'feed.dart';

class DetailTrip extends StatelessWidget {
  final tripDesc trip;

  DetailTrip({Key? key, required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: Text('Trip Details'),
        backgroundColor: Colors.grey,
        expandedHeight: 350.0,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            trip.Photo_reference,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildListDelegate([
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                trip.title,
                style: new TextStyle(fontSize: 30.0),
              ),
            ),
          ]),

          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  "${DateFormat('dd/mm/yyy').format(trip.startDate).toString()} to ${DateFormat('dd/mm/yyy').format(trip.endDate).toString()}",
                  style: new TextStyle(fontSize: 20.0)),
            ),
          ]),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: <Widget>[
              Text(
                "\Rs ${trip.Budget.toStringAsFixed(2)}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Spacer(),
              Text(
                trip.travelType,
                style: new TextStyle(fontSize: 20.0),
              ),
            ]),
          ),

          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Description', style: new TextStyle(fontSize: 20.0)),
            ),
          ]),
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Here comes the trip description',
                  style: new TextStyle(fontSize: 20.0)),
            ),
          ]),

          // description container issue to be resolved
          // Row(children: <Widget>[
          //   SizedBox.expand(
          //     child: Card(
          //       child: Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Container(
          //             width: double.maxFinite,
          //             child: Text(trip.desc,
          //                 style: new TextStyle(fontSize: 15.0))),
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       elevation: 2,
          //       margin: EdgeInsets.all(0),
          //     ),
          //   ),
          // ]),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //controller: mycontroller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'Number of seats',
                // hintText: 'Enter number of seats you want to book',
              ),
            ),
          ),

          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyFeed()),
                    );
                  },
                  child: const Text('Book'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black87,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(fontSize: 20),
                    //padding: const EdgeInsets.all(10.0),
                    fixedSize: const Size(200, 100),
                    //minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  )),
            ),
            Spacer(),
          ]),
        ]),
      )
    ])));
  }
}
