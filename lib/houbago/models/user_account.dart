class UserAccount {
  final String firstName;
  final String lastName;
  final double balance;
  final int weeklyReferrals;
  final int activeReferrals;

  const UserAccount({
    required this.firstName,
    required this.lastName,
    required this.balance,
    required this.weeklyReferrals,
    required this.activeReferrals,
  });
}

// Données de test
const dummyAccount = UserAccount(
  firstName: 'Jean',
  lastName: 'DUPONT',
  balance: 610275, // 930€ en FCFA
  weeklyReferrals: 3,
  activeReferrals: 12,
);
