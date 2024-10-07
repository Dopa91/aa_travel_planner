import 'package:aa_travel_planner/features/trip/screens/explore_trips_screen.dart';
import 'package:aa_travel_planner/features/destination/screens/destination_details_screen.dart';
import 'package:aa_travel_planner/features/destination/screens/explore_destinations_screen.dart';
import 'package:aa_travel_planner/features/carousel/widgets/carousel.dart';
import 'package:aa_travel_planner/features/destination/repositories/destination_repository.dart';
import 'package:aa_travel_planner/features/favorites/repositories/favorites_repository.dart';
import 'package:aa_travel_planner/features/favorites/screens/favorites_screen.dart';
import 'package:aa_travel_planner/features/settings/screens/__settings_screen_state.dart';
import 'package:aa_travel_planner/features/trip/models/trip.dart';
import 'package:aa_travel_planner/features/trip/repositories/trip_repository.dart';
import 'package:aa_travel_planner/features/trip/screens/trip_details_screen.dart';
import 'package:aa_travel_planner/features/destination/widgets/popular_destination_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final DestinationRepository destinationRepository = DestinationRepository();
  final TripRepository tripRepository = TripRepository();
  final FavoritesRepository favoritesRepository = FavoritesRepository();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(
        destinationRepository: widget.destinationRepository,
        tripRepository: widget.tripRepository,
        favoritesRepository: widget.favoritesRepository,
      ),
      ExploreTripsScreen(tripRepository: widget.tripRepository),
      ExploreDestinationsScreen(
        destinationRepository: widget.destinationRepository,
        favoritesRepository: widget.favoritesRepository,
      ),
      FavoritesScreen(
        favoritesRepository: widget.favoritesRepository,
      ),
      const SettingsScreen(),
    ];
  }

  final List<String> _appBarTitles = [
    'Home',
    'Explore Trips',
    'Explore Destinations',
    'Favorite Destinations',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitles[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[700],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => const TextStyle(color: Colors.white),
          ),
          indicatorColor: Colors.teal,
        ),
        child: NavigationBar(
          backgroundColor: Colors.teal[800],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.white70),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.airplane_ticket, color: Colors.white70),
              selectedIcon: Icon(Icons.airplane_ticket, color: Colors.white),
              label: 'Trips',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore, color: Colors.white70),
              selectedIcon: Icon(Icons.explore, color: Colors.white),
              label: 'Destina...',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite, color: Colors.white70),
              selectedIcon: Icon(Icons.favorite, color: Colors.white),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings, color: Colors.white70),
              selectedIcon: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

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
