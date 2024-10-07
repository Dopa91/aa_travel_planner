import 'package:aa_travel_planner/features/trip/repositories/trip_repository.dart';
import 'package:aa_travel_planner/features/trip/widgets/trip_card_horizontal.dart';
import 'package:aa_travel_planner/features/trip/widgets/trip_card_vertical.dart';
import 'package:flutter/material.dart';

class ExploreTripsScreen extends StatelessWidget {
  final TripRepository tripRepository;

  const ExploreTripsScreen({super.key, required this.tripRepository});

  @override
  Widget build(BuildContext context) {
    final trips = tripRepository.getAllTrips();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return TripCardHorizontal(trip: trip);
              },
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return TripCardVertical(trip: trip);
            },
          ),
        ],
      ),
    );
  }
}
