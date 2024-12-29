class UserAccount {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final double balance;
  final int activeReferrals;
  final int weeklyReferrals;
  final String? profilePicture;

  const UserAccount({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.balance,
    required this.activeReferrals,
    required this.weeklyReferrals,
    this.profilePicture,
  });
}

// Données de test
const UserAccount dummyAccount = UserAccount(
  firstName: 'John',
  lastName: 'Doe',
  phoneNumber: '+225 0123456789',
  balance: 75000,
  activeReferrals: 12,
  weeklyReferrals: 3,
);
