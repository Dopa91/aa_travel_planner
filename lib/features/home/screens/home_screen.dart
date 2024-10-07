import 'package:aa_travel_planner/features/carousel/widgets/carousel.dart';
import 'package:aa_travel_planner/features/destination/repositories/destination_repository.dart';
import 'package:aa_travel_planner/features/destination/screens/destination_details_screen.dart';
import 'package:aa_travel_planner/features/destination/widgets/popular_destination_card.dart';
import 'package:aa_travel_planner/features/favorites/repositories/favorites_repository.dart';
import 'package:aa_travel_planner/features/trip/models/trip.dart';
import 'package:aa_travel_planner/features/trip/repositories/trip_repository.dart';
import 'package:aa_travel_planner/features/trip/screens/trip_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final DestinationRepository destinationRepository;
  final TripRepository tripRepository;
  final FavoritesRepository favoritesRepository;

  const HomeScreen({
    super.key,
    required this.tripRepository,
    required this.favoritesRepository,
    required this.destinationRepository,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final trips = widget.tripRepository.getAllTrips();
    final favoriteDestinations = widget.favoritesRepository.getFavorites();
    final secretTip = trips.isNotEmpty ? trips[0] : null;
    final destinations = widget.destinationRepository.getAllDestinations();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recommended Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Carousel(
            favoritesRepository: widget.favoritesRepository,
            trips: trips,
            secretTip: secretTip,
            favoriteDestination: favoriteDestinations.isNotEmpty
                ? favoriteDestinations[0]
                : null,
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Explore Popular Destinations',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: destinations.length > 3 ? 3 : destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];

              return PopularDestinationCard(
                destination: destination,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestinationDetailsScreen(
                        favoritesRepository: widget.favoritesRepository,
                        destination: destination,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trips.length > 5 ? 5 : trips.length,
            itemBuilder: (context, index) {
              final Trip trip = trips[index];

              return ListTile(
                title: Text(trip.destination.name),
                subtitle: Text(trip.dateRange),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/${trip.destination.imageUrl}"),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TripDetailsScreen(trip: trip)),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
