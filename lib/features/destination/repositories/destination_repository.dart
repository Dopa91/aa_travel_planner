import 'package:aa_travel_planner/features/destination/models/destination.dart';

class DestinationRepository {
  final List<Destination> _destinations = [
    Destination(
      id: '1',
      name: 'Paris',
      country: 'France',
      description:
          'The City of Lights, famous for its culture and architecture.',
      imageUrl: 'paris.jpeg',
    ),
    Destination(
      id: '2',
      name: 'Tokyo',
      country: 'Japan',
      description:
          'A city blending tradition with modern technology, and full of vibrant districts.',
      imageUrl: 'tokyo.jpeg',
    ),
    Destination(
      id: '3',
      name: 'New York',
      country: 'USA',
      description:
          'The city that never sleeps, known for its iconic skyline and landmarks.',
      imageUrl: 'new_york.jpeg',
    ),
    Destination(
      id: '4',
      name: 'Rome',
      country: 'Italy',
      description:
          'A city steeped in history, with ancient ruins and Renaissance art.',
      imageUrl: 'rome.jpeg',
    ),
    Destination(
      id: '5',
      name: 'Sydney',
      country: 'Australia',
      description:
          'Known for its Sydney Opera House, Harbour Bridge, and beautiful beaches.',
      imageUrl: 'sydney.jpeg',
    ),
    Destination(
      id: '6',
      name: 'Rio de Janeiro',
      country: 'Brazil',
      description:
          'Famous for its Carnival, Christ the Redeemer, and breathtaking beaches.',
      imageUrl: 'rio_de_janeiro.jpeg',
    ),
    Destination(
      id: '7',
      name: 'Cape Town',
      country: 'South Africa',
      description:
          'A port city beneath Table Mountain, known for its stunning landscapes.',
      imageUrl: 'cape_town.jpeg',
    ),
  ];

  List<Destination> getAllDestinations() {
    return _destinations;
  }
}
