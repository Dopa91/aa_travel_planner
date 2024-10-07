import 'package:aa_travel_planner/features/trip/models/trip.dart';
import 'package:aa_travel_planner/shared/go_back_button.dart';
import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  const TripDetailsScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.destination.name),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/${trip.destination.imageUrl}",
                    fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text('Dates: ${trip.dateRange}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Itinerary:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(trip.itinerary, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              GoBackButton(
                buttonText: 'Go Back',
                action: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
