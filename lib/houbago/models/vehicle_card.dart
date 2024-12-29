class VehicleCard {
  final String title;
  final String description;
  final String imageUrl;
  final String price;

  VehicleCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

// Données factices pour les motos
final List<VehicleCard> motorcycleCards = [
  VehicleCard(
    title: 'Yamaha MT-07',
    description: 'Moto sportive et agile, parfaite pour la ville',
    imageUrl: 'https://picsum.photos/300/200?random=1',
    price: '7 990 €',
  ),
  VehicleCard(
    title: 'Honda CB650R',
    description: 'Design néo-rétro avec performances modernes',
    imageUrl: 'https://picsum.photos/300/200?random=2',
    price: '8 499 €',
  ),
  VehicleCard(
    title: 'Kawasaki Z900',
    description: 'Puissance et style agressif',
    imageUrl: 'https://picsum.photos/300/200?random=3',
    price: '9 299 €',
  ),
  VehicleCard(
    title: 'Ducati Monster',
    description: 'L\'icône italienne revisitée',
    imageUrl: 'https://picsum.photos/300/200?random=4',
    price: '11 490 €',
  ),
];

// Données factices pour les voitures
final List<VehicleCard> carCards = [
  VehicleCard(
    title: 'Peugeot 308',
    description: 'Compacte moderne et économique',
    imageUrl: 'https://picsum.photos/300/200?random=5',
    price: '26 900 €',
  ),
  VehicleCard(
    title: 'Renault Megane E-Tech',
    description: '100% électrique, 0% compromis',
    imageUrl: 'https://picsum.photos/300/200?random=6',
    price: '35 200 €',
  ),
  VehicleCard(
    title: 'Volkswagen Golf',
    description: 'La référence des compactes',
    imageUrl: 'https://picsum.photos/300/200?random=7',
    price: '28 990 €',
  ),
  VehicleCard(
    title: 'Tesla Model 3',
    description: 'Performance électrique premium',
    imageUrl: 'https://picsum.photos/300/200?random=8',
    price: '45 990 €',
  ),
];
