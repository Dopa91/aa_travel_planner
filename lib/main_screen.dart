import 'package:aa_travel_planner/features/trip/screens/explore_trips_screen.dart';
import 'package:aa_travel_planner/features/destination/screens/explore_destinations_screen.dart';
import 'package:aa_travel_planner/features/destination/repositories/destination_repository.dart';
import 'package:aa_travel_planner/features/favorites/repositories/favorites_repository.dart';
import 'package:aa_travel_planner/features/favorites/screens/favorites_screen.dart';
import 'package:aa_travel_planner/features/settings/screens/__settings_screen_state.dart';
import 'package:aa_travel_planner/features/trip/repositories/trip_repository.dart';
import 'package:aa_travel_planner/features/home/screens/home_screen.dart';
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
