import 'package:houbago/houbago/utils/currency_formatter.dart';

class NotificationItem {
  final String title;
  final String message;
  final DateTime date;
  final NotificationType type;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    required this.type,
    this.isRead = false,
  });
}

enum NotificationType {
  earning,
  system,
  promo,
  warning
}

// Données de test
final List<NotificationItem> dummyNotifications = [
  NotificationItem(
    title: 'Nouveau gain',
    message: 'Vous avez reçu un paiement de ${CurrencyFormatter.formatFCFA(32800)}', // 50€
    date: DateTime.now().subtract(const Duration(hours: 2)),
    type: NotificationType.earning,
  ),
  NotificationItem(
    title: 'Promotion',
    message: 'Gagnez 2x plus ce weekend !',
    date: DateTime.now().subtract(const Duration(days: 1)),
    type: NotificationType.promo,
  ),
  NotificationItem(
    title: 'Maintenance',
    message: 'Mise à jour du système prévue demain',
    date: DateTime.now().subtract(const Duration(days: 2)),
    type: NotificationType.system,
  ),
  NotificationItem(
    title: 'Bonus journalier',
    message: 'Félicitations ! Vous avez atteint votre objectif quotidien',
    date: DateTime.now().subtract(const Duration(days: 3)),
    type: NotificationType.earning,
  ),
  NotificationItem(
    title: 'Attention',
    message: 'Pensez à mettre à jour vos documents',
    date: DateTime.now().subtract(const Duration(days: 4)),
    type: NotificationType.warning,
  ),
  NotificationItem(
    title: 'Nouveau partenariat',
    message: 'Découvrez nos nouveaux partenaires restaurants',
    date: DateTime.now().subtract(const Duration(days: 5)),
    type: NotificationType.promo,
  ),
  NotificationItem(
    title: 'Prime exceptionnelle',
    message: 'Une prime de ${CurrencyFormatter.formatFCFA(65600)} vous a été versée', // 100€
    date: DateTime.now().subtract(const Duration(days: 6)),
    type: NotificationType.earning,
  ),
  NotificationItem(
    title: 'Maintenance terminée',
    message: 'La mise à jour du système a été effectuée avec succès',
    date: DateTime.now().subtract(const Duration(days: 7)),
    type: NotificationType.system,
  ),
];
