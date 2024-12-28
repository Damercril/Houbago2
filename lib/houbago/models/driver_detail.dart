class DriverDetail {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime registrationDate;
  final DateTime lastRideDate;
  final String photoUrl;
  final String vehicleType; // 'moto' ou 'car'
  final int totalRides;
  final double rating;
  final double totalEarnings;
  final int referredDrivers;
  final String status; // 'active', 'inactive', 'pending'

  DriverDetail({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.registrationDate,
    required this.lastRideDate,
    required this.photoUrl,
    required this.vehicleType,
    required this.totalRides,
    required this.rating,
    required this.totalEarnings,
    required this.referredDrivers,
    required this.status,
  });

  String get fullName => '$firstName $lastName';
}

// Données factices pour la recherche
final List<DriverDetail> dummyDrivers = [
  DriverDetail(
    id: '1',
    firstName: 'Jean',
    lastName: 'Dupont',
    phoneNumber: '06 12 34 56 78',
    registrationDate: DateTime(2023, 11, 15),
    lastRideDate: DateTime(2023, 12, 28, 18, 30), // Aujourd'hui à 18h30
    photoUrl: 'https://i.pravatar.cc/150?img=1',
    vehicleType: 'car',
    totalRides: 156,
    rating: 4.8,
    totalEarnings: 1867500.0,
    referredDrivers: 3,
    status: 'active',
  ),
  DriverDetail(
    id: '2',
    firstName: 'Marie',
    lastName: 'Martin',
    phoneNumber: '06 98 76 54 32',
    registrationDate: DateTime(2023, 10, 20),
    lastRideDate: DateTime(2023, 12, 28, 15, 45), // Aujourd'hui à 15h45
    photoUrl: 'https://i.pravatar.cc/150?img=2',
    vehicleType: 'moto',
    totalRides: 89,
    rating: 4.6,
    totalEarnings: 1309250.0,
    referredDrivers: 1,
    status: 'active',
  ),
  DriverDetail(
    id: '3',
    firstName: 'Pierre',
    lastName: 'Bernard',
    phoneNumber: '06 45 67 89 01',
    registrationDate: DateTime(2023, 12, 1),
    lastRideDate: DateTime(2023, 12, 27, 20, 15), // Hier à 20h15
    photoUrl: 'https://i.pravatar.cc/150?img=3',
    vehicleType: 'car',
    totalRides: 42,
    rating: 4.9,
    totalEarnings: 654625.0,
    referredDrivers: 0,
    status: 'pending',
  ),
  DriverDetail(
    id: '4',
    firstName: 'Sophie',
    lastName: 'Petit',
    phoneNumber: '06 45 67 89 01',
    registrationDate: DateTime(2023, 9, 30),
    lastRideDate: DateTime(2023, 12, 25, 12, 0), // Le 25 décembre à 12h00
    photoUrl: 'https://i.pravatar.cc/150?img=4',
    vehicleType: 'moto',
    totalRides: 134,
    rating: 4.7,
    totalEarnings: 2100.0,
    referredDrivers: 2,
    status: 'inactive',
  ),
  DriverDetail(
    id: '5',
    firstName: 'Thomas',
    lastName: 'Dubois',
    phoneNumber: '06 56 78 90 12',
    registrationDate: DateTime(2023, 11, 1),
    lastRideDate: DateTime(2023, 12, 26, 18, 0), // Le 26 décembre à 18h00
    photoUrl: 'https://i.pravatar.cc/150?img=5',
    vehicleType: 'car',
    totalRides: 78,
    rating: 4.5,
    totalEarnings: 1680.0,
    referredDrivers: 1,
    status: 'pending',
  ),
];
