import 'package:flutter/material.dart';
import 'package:houbago/houbago/houbago_theme.dart';
import 'package:houbago/houbago/models/notification.dart';
import 'package:intl/intl.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationsList({
    super.key,
    required this.notifications,
  });

  IconData _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.earning:
        return Icons.monetization_on;
      case NotificationType.system:
        return Icons.system_update;
      case NotificationType.promo:
        return Icons.local_offer;
      case NotificationType.warning:
        return Icons.warning;
    }
  }

  Color _getNotificationColor(NotificationType type) {
    switch (type) {
      case NotificationType.earning:
        return Colors.green;
      case NotificationType.system:
        return Colors.blue;
      case NotificationType.promo:
        return HoubagoTheme.primary;
      case NotificationType.warning:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: HoubagoTheme.textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Implémenter la vue détaillée des notifications
                  },
                  child: const Text('Voir tout'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300), // Hauteur maximale pour la liste
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(), // Active le défilement
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getNotificationColor(notification.type).withOpacity(0.1),
                    child: Icon(
                      _getNotificationIcon(notification.type),
                      color: _getNotificationColor(notification.type),
                      size: 20,
                    ),
                  ),
                  title: Text(
                    notification.title,
                    style: HoubagoTheme.textTheme.titleSmall,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.message,
                        style: HoubagoTheme.textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(notification.date),
                        style: HoubagoTheme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // TODO: Implémenter l'action au clic sur une notification
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
