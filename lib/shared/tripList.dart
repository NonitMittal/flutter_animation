import 'package:flutter/material.dart';
import 'package:flutter_animation/models/Trip.dart';
import 'package:flutter_animation/screens/details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final List<Widget> _tripTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _addTrips() {
    // get data from db
    List<Trip> trips = [
      Trip(
          title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    for (var trip in trips) {
      _tripTiles.add(_buildTile(trip));
    }
  }

  Widget _buildTile(Trip trip) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Padding(
              padding: EdgeInsets.only(
                  top: value * 25, left: value * 15, right: value * 15),
              child: child),
        );
      },
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Details(trip: trip)));
        },
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${trip.nights} nights',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue[300],
              ),
            ),
            Text(
              trip.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          ],
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Hero(
            tag: 'location-img-${trip.img}',
            child: Image.asset(
              'images/${trip.img}',
              height: 70.0,
            ),
          ),
        ),
        trailing: Text(
          '\$ ${trip.price}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _tripTiles.length,
        itemBuilder: (context, index) {
          return _tripTiles[index];
        });
  }
}
