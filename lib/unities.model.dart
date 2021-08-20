class Unit {
  final String name;
  final double conversion;

  /// A [Unit] stores its name and conversion factor.
  ///
  /// An example would be 'Meter' and '1.0'.
  const Unit({
    required this.name,
    required this.conversion,
  });

  /// Creates a [Unit] from a JSON object.
  Unit.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        conversion = jsonMap['conversion'].toDouble();
}
