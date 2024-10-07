import 'package:aa_travel_planner/features/destination/models/destination.dart';
import 'package:aa_travel_planner/features/favorites/repositories/favorites_repository.dart';
import 'package:aa_travel_planner/shared/go_back_button.dart';
import 'package:flutter/material.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;
  final FavoritesRepository favoritesRepository;

  const DestinationDetailsScreen({
    super.key,
    required this.destination,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
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
                child: Image.asset(
                  "assets/images/${destination.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text('Country: ${destination.country}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(destination.description,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GoBackButton(
                    buttonText: 'Go Back',
                    action: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      favoritesRepository.addFavorite(destination);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[600]),
                    child: const Text(
                      'Add to favorites',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
