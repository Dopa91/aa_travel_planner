import 'package:aa_travel_planner/features/destination/models/destination.dart';
import 'package:aa_travel_planner/features/trip/models/trip.dart';

class TripRepository {
  final List<Trip> _trips = [
    Trip(
      id: '101',
      destination: Destination(
        id: '1',
        name: 'Paris',
        country: 'France',
        description:
            'The City of Lights, famous for its culture and architecture.',
        imageUrl: 'paris.jpeg',
      ),
      dateRange: '10-15 Oct 2024',
      itinerary:
          'Visit Eiffel Tower, Louvre Museum, and stroll through Montmartre.',
    ),
    Trip(
      id: '102',
      destination: Destination(
        id: '2',
        name: 'Tokyo',
        country: 'Japan',
        description:
            'A vibrant city blending tradition with modern technology, and full of vibrant districts.',
        imageUrl: 'tokyo.jpeg',
      ),
      dateRange: '20-25 Nov 2024',
      itinerary: 'See Shibuya Crossing, visit Senso-ji, and explore Harajuku.',
    ),
    Trip(
      id: '103',
      destination: Destination(
        id: '3',
        name: 'New York',
        country: 'USA',
        description:
            'The city that never sleeps, known for its iconic skyline and landmarks.',
        imageUrl: 'new_york.jpeg',
      ),
      dateRange: '5-10 Dec 2024',
      itinerary: 'Visit Central Park, Statue of Liberty, and Times Square.',
    ),
    Trip(
      id: '104',
      destination: Destination(
        id: '4',
        name: 'Rome',
        country: 'Italy',
        description:
            'A city steeped in history, with ancient ruins and Renaissance art.',
        imageUrl: 'rome.jpeg',
      ),
      dateRange: '15-20 Jan 2025',
      itinerary: 'Tour the Colosseum, Roman Forum, and Vatican City.',
    ),
    Trip(
      id: '105',
      destination: Destination(
        id: '5',
        name: 'Sydney',
        country: 'Australia',
        description:
            'Known for its Sydney Opera House, Harbour Bridge, and beautiful beaches.',
        imageUrl: 'sydney.jpeg',
      ),
      dateRange: '25-30 Feb 2025',
      itinerary:
          'See the Opera House, climb the Harbour Bridge, and relax at Bondi Beach.',
    ),
    Trip(
      id: '106',
      destination: Destination(
        id: '6',
        name: 'Rio de Janeiro',
        country: 'Brazil',
        description:
            'Famous for its Carnival, Christ the Redeemer, and breathtaking beaches.',
        imageUrl: 'rio_de_janeiro.jpeg',
      ),
      dateRange: '10-15 Mar 2025',
      itinerary:
          'Visit Christ the Redeemer, Sugarloaf Mountain, and Copacabana Beach.',
    ),
    Trip(
      id: '107',
      destination: Destination(
        id: '7',
        name: 'Cape Town',
        country: 'South Africa',
        description:
            'A port city beneath Table Mountain, known for its stunning landscapes.',
        imageUrl: 'cape_town.jpeg',
      ),
      dateRange: '20-25 Apr 2025',
      itinerary: 'Explore Table Mountain, V&A Waterfront, and Robben Island.',
    ),
  ];

  List<Trip> getAllTrips() {
    return _trips;
  }
}
