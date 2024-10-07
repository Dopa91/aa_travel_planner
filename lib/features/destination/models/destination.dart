class Destination {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;

  Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
  });

  // Damit zwei Objekte mit den selben Daten als gleich angesehen werden.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Destination) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
