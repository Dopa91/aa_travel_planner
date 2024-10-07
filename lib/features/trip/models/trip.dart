import 'package:aa_travel_planner/features/destination/models/destination.dart';

class Trip {
  final String id;
  final Destination destination;
  final String dateRange;
  final String itinerary;

  Trip({
    required this.id,
    required this.destination,
    required this.dateRange,
    required this.itinerary,
  });

  // Damit zwei Objekte mit den selben Daten als gleich angesehen werden.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Trip) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
