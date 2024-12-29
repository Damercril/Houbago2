import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:houbago/houbago/houbago_theme.dart';
import 'package:houbago/houbago/models/earnings.dart';
import 'package:houbago/houbago/models/notification.dart';
import 'package:houbago/houbago/models/user_account.dart';
import 'package:houbago/houbago/ui_view/notifications_list.dart';
import 'package:houbago/houbago/utils/currency_formatter.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HoubagoTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Première section : Informations chauffeur
              const _DriverInfoCard(),
              const SizedBox(height: 16),
              // Deuxième section : Graphique des gains
              Container(
                height: 300,
                padding: const EdgeInsets.all(16),
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
                    Text(
                      'Vos gains',
                      style: HoubagoTheme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const Expanded(child: _EarningsChart()),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Troisième section : Notifications
              Container(
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
                child: NotificationsList(notifications: dummyNotifications),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DriverInfoCard extends StatelessWidget {
  const _DriverInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HoubagoTheme.primary,
            HoubagoTheme.primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: HoubagoTheme.primary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête avec photo de profil, nom et statistiques
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo de profil et nom
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: HoubagoTheme.textLight,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${dummyAccount.firstName}',
                            style: HoubagoTheme.textTheme.titleLarge?.copyWith(
                              color: HoubagoTheme.textLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${dummyAccount.lastName}',
                            style: HoubagoTheme.textTheme.titleMedium?.copyWith(
                              color: HoubagoTheme.textLight.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Statistiques
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCompactStat(
                      dummyAccount.activeReferrals.toString(),
                      'actifs',
                      Icons.people,
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    _buildCompactStat(
                      dummyAccount.weeklyReferrals.toString(),
                      'parrainés',
                      Icons.group_add,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Solde disponible
          Text(
            'Solde disponible',
            style: HoubagoTheme.textTheme.bodyLarge?.copyWith(
              color: HoubagoTheme.textLight.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            CurrencyFormatter.formatFCFA(dummyAccount.balance),
            style: HoubagoTheme.textTheme.headlineSmall?.copyWith(
              color: HoubagoTheme.textLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // Bouton de retrait en bas
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Implémenter le retrait
              },
              icon: const Icon(Icons.wallet, size: 18),
              label: const Text('Retirer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: HoubagoTheme.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactStat(String value, String label, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: HoubagoTheme.textLight,
          size: 16,
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HoubagoTheme.textLight.withOpacity(0.8),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EarningsChart extends StatelessWidget {
  const _EarningsChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: (value, meta) {
                return Text(
                  CurrencyFormatter.formatNumber(value),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < dummyEarningsData.length) {
                  final date = dummyEarningsData[value.toInt()].date;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      DateFormat('E').format(date),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: dummyEarningsData.length.toDouble() - 1,
        minY: 0,
        maxY: dummyEarningsData.map((e) => e.amount).reduce((a, b) => a > b ? a : b) * 1.2,
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              dummyEarningsData.length,
              (index) => FlSpot(
                index.toDouble(),
                dummyEarningsData[index].amount,
              ),
            ),
            isCurved: true,
            color: HoubagoTheme.primary,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: HoubagoTheme.primary,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: HoubagoTheme.primary.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            tooltipRoundedRadius: 8,
            tooltipBorder: const BorderSide(color: Colors.black12),
            tooltipPadding: const EdgeInsets.all(8),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final amount = dummyEarningsData[touchedSpot.x.toInt()].amount;
                return LineTooltipItem(
                  CurrencyFormatter.formatNumber(amount),
                  TextStyle(
                    color: HoubagoTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
