class Driver {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime registrationDate;
  final String photoUrl;

  Driver({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.registrationDate,
    required this.photoUrl,
  });
}

// Données factices pour les conducteurs de moto
final List<Driver> motorcycleDrivers = [
  Driver(
    firstName: 'Jean',
    lastName: 'Dupont',
    phoneNumber: '06 12 34 56 78',
    registrationDate: DateTime(2023, 11, 15),
    photoUrl: 'https://i.pravatar.cc/150?img=1',
  ),
  Driver(
    firstName: 'Marie',
    lastName: 'Martin',
    phoneNumber: '06 23 45 67 89',
    registrationDate: DateTime(2023, 10, 20),
    photoUrl: 'https://i.pravatar.cc/150?img=2',
  ),
  Driver(
    firstName: 'Pierre',
    lastName: 'Bernard',
    phoneNumber: '06 34 56 78 90',
    registrationDate: DateTime(2023, 12, 5),
    photoUrl: 'https://i.pravatar.cc/150?img=3',
  ),
  Driver(
    firstName: 'Sophie',
    lastName: 'Petit',
    phoneNumber: '06 45 67 89 01',
    registrationDate: DateTime(2023, 9, 30),
    photoUrl: 'https://i.pravatar.cc/150?img=4',
  ),
];

// Données factices pour les conducteurs de voiture
final List<Driver> carDrivers = [
  Driver(
    firstName: 'Thomas',
    lastName: 'Dubois',
    phoneNumber: '06 56 78 90 12',
    registrationDate: DateTime(2023, 11, 1),
    photoUrl: 'https://i.pravatar.cc/150?img=5',
  ),
  Driver(
    firstName: 'Julie',
    lastName: 'Robert',
    phoneNumber: '06 67 89 01 23',
    registrationDate: DateTime(2023, 10, 15),
    photoUrl: 'https://i.pravatar.cc/150?img=6',
  ),
  Driver(
    firstName: 'Nicolas',
    lastName: 'Moreau',
    phoneNumber: '06 78 90 12 34',
    registrationDate: DateTime(2023, 12, 10),
    photoUrl: 'https://i.pravatar.cc/150?img=7',
  ),
  Driver(
    firstName: 'Emma',
    lastName: 'Laurent',
    phoneNumber: '06 89 01 23 45',
    registrationDate: DateTime(2023, 9, 25),
    photoUrl: 'https://i.pravatar.cc/150?img=8',
  ),
];
