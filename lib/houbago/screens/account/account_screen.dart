import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houbago/houbago/houbago_theme.dart';
import 'package:houbago/houbago/models/user_profile.dart';
import 'package:houbago/houbago/models/user_account.dart';
import 'package:houbago/houbago/models/withdrawal.dart';
import 'package:intl/intl.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:houbago/houbago/screens/support/support_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _notificationsEnabled = dummyProfile.notificationsEnabled;

  void _copyReferralCode() {
    Clipboard.setData(ClipboardData(text: dummyProfile.referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code de parrainage copié !'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showPaymentRequestDialog(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    final double maxAmount = dummyAccount.balance; // Solde disponible
    String? errorText;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Demande de paiement',
                      style: HoubagoTheme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Solde disponible: ${maxAmount.toStringAsFixed(0)} FCFA',
                      style: HoubagoTheme.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Montant en FCFA',
                        errorText: errorText,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.attach_money),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            errorText = 'Veuillez entrer un montant';
                          } else {
                            final amount = double.tryParse(value) ?? 0;
                            if (amount <= 0) {
                              errorText = 'Le montant doit être supérieur à 0';
                            } else if (amount > maxAmount) {
                              errorText = 'Montant supérieur au solde disponible';
                            } else {
                              errorText = null;
                            }
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Annuler',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            final amount = double.tryParse(amountController.text) ?? 0;
                            if (amount > 0 && amount <= maxAmount) {
                              // TODO: Traiter la demande de paiement
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Demande de paiement de ${amount.toStringAsFixed(0)} FCFA envoyée',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: HoubagoTheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Confirmer'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HoubagoTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 24),
              _buildSection(
                title: 'Compte Yango',
                children: [
                  _buildListTile(
                    icon: Icons.business,
                    title: 'Nom du partenaire',
                    subtitle: dummyProfile.yangoId,
                  ),
                  _buildListTile(
                    icon: Icons.calendar_today,
                    title: 'Date d\'inscription',
                    subtitle: DateFormat('dd/MM/yyyy')
                        .format(dummyProfile.registrationDate),
                  ),
                  _buildListTile(
                    icon: Icons.share,
                    title: 'Code de parrainage',
                    subtitle: dummyProfile.referralCode,
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: _copyReferralCode,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        _showPaymentRequestDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HoubagoTheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.payment, size: 24),
                          const SizedBox(width: 12),
                          Text(
                            'Faire une demande de paiement',
                            style: HoubagoTheme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              _buildSection(
                title: 'Préférences',
                children: [
                  SwitchListTile(
                    secondary: Icon(
                      Icons.notifications,
                      color: HoubagoTheme.primary,
                    ),
                    title: const Text('Notifications'),
                    subtitle: const Text('Recevoir les notifications'),
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              _buildSection(
                title: 'Support',
                children: [
                  _buildListTile(
                    icon: Icons.contact_support,
                    title: 'Contacter le support',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SupportScreen(),
                        ),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.policy,
                    title: 'Politique de confidentialité',
                    onTap: () {
                      // TODO: Afficher la politique de confidentialité
                    },
                  ),
                  _buildListTile(
                    icon: Icons.delete_forever,
                    title: 'Supprimer mon compte',
                    textColor: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Supprimer mon compte'),
                          content: const Text(
                            'Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Implémenter la suppression du compte
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Supprimer',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              _buildSection(
                title: 'Application',
                children: [
                  _buildListTile(
                    icon: Icons.info_outline,
                    title: 'Version',
                    subtitle: '1.0.0',
                  ),
                  _buildListTile(
                    icon: Icons.logout,
                    title: 'Déconnexion',
                    textColor: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Déconnexion'),
                          content: const Text(
                            'Êtes-vous sûr de vouloir vous déconnecter ?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Fermer la boîte de dialogue
                                Navigator.pop(context);
                                // Rediriger vers l'écran de connexion
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false, // Supprime toutes les routes précédentes
                                );
                              },
                              child: Text(
                                'Déconnexion',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              _buildWithdrawalHistory(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HoubagoTheme.backgroundLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(dummyProfile.photoUrl),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: HoubagoTheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: HoubagoTheme.textLight,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: dummyProfile.yangoId,
                  drawText: false,
                  width: 100,
                  height: 100,
                  color: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            dummyProfile.fullName,
            style: HoubagoTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            dummyProfile.phoneNumber,
            style: HoubagoTheme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: Text(
            title,
            style: HoubagoTheme.textTheme.titleMedium?.copyWith(
              color: HoubagoTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: HoubagoTheme.backgroundLight,
            border: Border(
              top: BorderSide(color: Colors.grey[200]!),
              bottom: BorderSide(color: Colors.grey[200]!),
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? HoubagoTheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ??
          (onTap != null
              ? const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              : null),
      onTap: onTap,
    );
  }

  Widget _buildWithdrawalHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Historique des retraits',
          style: HoubagoTheme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...dummyWithdrawals.map((withdrawal) => _buildWithdrawalItem(withdrawal)),
      ],
    );
  }

  Widget _buildWithdrawalItem(Withdrawal withdrawal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${withdrawal.amount.toStringAsFixed(0)} FCFA',
            style: HoubagoTheme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                withdrawal.accountNumber ?? '',
                style: HoubagoTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              Text(
                _formatDate(withdrawal.date),
                style: HoubagoTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
