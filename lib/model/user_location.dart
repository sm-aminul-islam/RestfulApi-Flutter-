class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinate;
  final LocationTimezoneCoordinate timezone;
  UserLocation(
      {required this.city,
      required this.coordinate,
      required this.country,
      required this.postcode,
      required this.state,
      required this.street,
      required this.timezone});
  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final timezone = LocationTimezoneCoordinate.fromMap(json['timezone']);
    final coordinates = LocationCoordinate.fromMap(json['coordinates']);
    final street = LocationStreet.fromMap(json['street']);
    return UserLocation(
        city: json['city'],
        coordinate: coordinates,
        country: json['country'],
        postcode: json['postcode'].toString(),
        state: json['state'],
        street: street,
        timezone: timezone);
  }
}

class LocationCoordinate {
  final String latitude;
  final String longitude;
  LocationCoordinate({required this.latitude, required this.longitude});
  factory LocationCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationCoordinate(
        latitude: json['latitude'], longitude: json['longitude']);
  }
}

class LocationTimezoneCoordinate {
  final String offset;
  final String description;
  LocationTimezoneCoordinate({required this.offset, required this.description});
  factory LocationTimezoneCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationTimezoneCoordinate(
        offset: json['timezone']['offset'],
        description: json['timezone']['description']);
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.name, required this.number});
  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
        name: json['street']['name'], number: json['street']['number']);
  }
}
