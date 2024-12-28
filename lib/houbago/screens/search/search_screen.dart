import 'package:flutter/material.dart';
import 'package:houbago/houbago/houbago_theme.dart';
import 'package:houbago/houbago/models/driver_detail.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:houbago/houbago/utils/currency_formatter.dart';
import 'package:fl_chart/fl_chart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  String _selectedVehicleType = 'all';
  String _selectedStatus = 'all';
  List<DriverDetail> _filteredDrivers = [];
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
    _filteredDrivers = dummyDrivers;
  }

  void _filterDrivers() {
    setState(() {
      _filteredDrivers = dummyDrivers.where((driver) {
        final matchesSearch = driver.fullName.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ) ||
            driver.phoneNumber.contains(_searchController.text);

        final matchesVehicleType = _selectedVehicleType == 'all' ||
            driver.vehicleType == _selectedVehicleType;

        final matchesStatus =
            _selectedStatus == 'all' || driver.status == _selectedStatus;

        return matchesSearch && matchesVehicleType && matchesStatus;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HoubagoTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchHeader(),
            _buildFilters(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2023),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: HoubagoTheme.primary,
                                onPrimary: Colors.white,
                                surface: Colors.white,
                                onSurface: HoubagoTheme.textPrimary,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        setState(() {
                          _selectedDate = date;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: HoubagoTheme.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Semaine du ${DateFormat('d MMM', 'fr_FR').format(_selectedDate)}',
                          style: TextStyle(
                            color: HoubagoTheme.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      _DateButton(
                        icon: Icons.chevron_left,
                        onTap: () {
                          setState(() {
                            _selectedDate = _selectedDate.subtract(const Duration(days: 7));
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      _DateButton(
                        icon: Icons.chevron_right,
                        onTap: () {
                          final newDate = _selectedDate.add(const Duration(days: 7));
                          if (!newDate.isAfter(DateTime.now())) {
                            setState(() {
                              _selectedDate = newDate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Activité de l\'équipe',
                      style: HoubagoTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value % 1 != 0) return const Text('');
                                  final weekDays = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];
                                  final index = value.toInt() % weekDays.length;
                                  return Text(
                                    weekDays[index],
                                    style: TextStyle(
                                      color: HoubagoTheme.textSecondary,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                const FlSpot(0, 3),
                                const FlSpot(1, 4),
                                const FlSpot(2, 3.5),
                                const FlSpot(3, 5),
                                const FlSpot(4, 4),
                                const FlSpot(5, 4.5),
                                const FlSpot(6, 4.8),
                              ],
                              isCurved: true,
                              color: HoubagoTheme.primary,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
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
                                  return LineTooltipItem(
                                    '${touchedSpot.y.toStringAsFixed(1)} courses',
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _filteredDrivers.isEmpty
                  ? Center(
                      child: Text(
                        'Aucun chauffeur trouvé',
                        style: HoubagoTheme.textTheme.titleMedium,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredDrivers.length,
                      itemBuilder: (context, index) {
                        return _DriverCard(driver: _filteredDrivers[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: TextField(
        controller: _searchController,
        onChanged: (_) => _filterDrivers(),
        decoration: InputDecoration(
          hintText: 'Rechercher un chauffeur...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _FilterDropdown(
              value: _selectedVehicleType,
              items: const [
                DropdownMenuItem(value: 'all', child: Text('Tous les véhicules')),
                DropdownMenuItem(value: 'car', child: Text('Voiture')),
                DropdownMenuItem(value: 'moto', child: Text('Moto')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedVehicleType = value ?? 'all';
                  _filterDrivers();
                });
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _FilterDropdown(
              value: _selectedStatus,
              items: const [
                DropdownMenuItem(value: 'all', child: Text('Tous les statuts')),
                DropdownMenuItem(value: 'active', child: Text('Actif')),
                DropdownMenuItem(value: 'inactive', child: Text('Inactif')),
                DropdownMenuItem(value: 'pending', child: Text('En attente')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value ?? 'all';
                  _filterDrivers();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _FilterDropdown extends StatelessWidget {
  const _FilterDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: value,
        items: items,
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

class _DriverCard extends StatelessWidget {
  const _DriverCard({
    required this.driver,
  });

  final DriverDetail driver;

  Color _getStatusColor() {
    switch (driver.status) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText() {
    switch (driver.status) {
      case 'active':
        return 'Actif';
      case 'inactive':
        return 'Inactif';
      case 'pending':
        return 'En attente';
      default:
        return 'Inconnu';
    }
  }

  String _formatLastRideDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return "Aujourd'hui ${DateFormat('HH:mm').format(date)}";
    } else if (difference.inDays == 1) {
      return "Hier ${DateFormat('HH:mm').format(date)}";
    } else if (difference.inDays < 7) {
      return DateFormat('E HH:mm').format(date);
    } else {
      return DateFormat('dd/MM/yy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(driver.photoUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driver.fullName,
                        style: HoubagoTheme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        driver.phoneNumber,
                        style: HoubagoTheme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _getStatusText(),
                    style: TextStyle(
                      color: _getStatusColor(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  icon: Icons.directions_car,
                  label: 'Courses',
                  value: driver.totalRides.toString(),
                ),
                _StatItem(
                  icon: Icons.access_time,
                  label: 'Dernière course',
                  value: _formatLastRideDate(driver.lastRideDate),
                ),
                _StatItem(
                  icon: Icons.monetization_on,
                  label: 'Gains',
                  value: CurrencyFormatter.formatFCFA(driver.totalEarnings),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Inscrit le ${DateFormat('dd/MM/yyyy').format(driver.registrationDate)}',
              style: HoubagoTheme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: HoubagoTheme.primary,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: HoubagoTheme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: HoubagoTheme.textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class _DateButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _DateButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: HoubagoTheme.backgroundDark.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 20,
          color: HoubagoTheme.textSecondary,
        ),
      ),
    );
  }
}
