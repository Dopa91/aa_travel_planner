import 'package:aa_travel_planner/features/destination/screens/destination_details_screen.dart';
import 'package:aa_travel_planner/features/destination/models/destination.dart';
import 'package:aa_travel_planner/features/favorites/repositories/favorites_repository.dart';
import 'package:aa_travel_planner/features/trip/models/trip.dart';
import 'package:aa_travel_planner/features/trip/screens/trip_details_screen.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final FavoritesRepository? favoritesRepository;
  final Trip? trip;
  final Destination? destination;
  final String? label;

  const CarouselItem({
    super.key,
    this.trip,
    this.destination,
    this.label,
    this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        trip != null ? trip!.destination.imageUrl : destination!.imageUrl;
    final String title =
        trip != null ? trip!.destination.name : destination!.name;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => trip == null
            ? DestinationDetailsScreen(
                destination: destination!,
                favoritesRepository: favoritesRepository!,
              )
            : TripDetailsScreen(trip: trip!),
      )),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage("assets/images/$imageUrl"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (label != null)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  label!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
