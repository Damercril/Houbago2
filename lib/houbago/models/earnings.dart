class EarningsData {
  final DateTime date;
  final double amount; // Montant en FCFA

  const EarningsData(this.date, this.amount);
}

// Données de test
final List<EarningsData> dummyEarningsData = [
  EarningsData(DateTime.now().subtract(const Duration(days: 6)), 32800), // 50€
  EarningsData(DateTime.now().subtract(const Duration(days: 5)), 45840), // 70€
  EarningsData(DateTime.now().subtract(const Duration(days: 4)), 39360), // 60€
  EarningsData(DateTime.now().subtract(const Duration(days: 3)), 52360), // 80€
  EarningsData(DateTime.now().subtract(const Duration(days: 2)), 65600), // 100€
  EarningsData(DateTime.now().subtract(const Duration(days: 1)), 49200), // 75€
  EarningsData(DateTime.now(), 42600), // 65€
];
