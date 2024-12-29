import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:houbago/houbago/houbago_theme.dart';
import 'package:houbago/houbago/models/driver.dart';
import 'package:houbago/houbago/models/vehicle_card.dart';
import 'package:intl/intl.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HoubagoTheme.background,
        appBar: AppBar(
          backgroundColor: HoubagoTheme.background,
          title: const Text('Équipe'),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Moto'),
              Tab(text: 'Voiture'),
            ],
            labelColor: HoubagoTheme.primary,
            unselectedLabelColor: HoubagoTheme.textSecondary,
            indicatorColor: HoubagoTheme.primary,
          ),
        ),
        body: TabBarView(
          children: [
            _VehicleTab(
              vehicles: motorcycleCards,
              drivers: motorcycleDrivers,
            ),
            _VehicleTab(
              vehicles: carCards,
              drivers: carDrivers,
            ),
          ],
        ),
      ),
    );
  }
}

class _VehicleTab extends StatelessWidget {
  const _VehicleTab({
    required this.vehicles,
    required this.drivers,
  });

  final List<VehicleCard> vehicles;
  final List<Driver> drivers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Swiper(
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.network(
                        vehicle.imageUrl,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                vehicle.title,
                                style: HoubagoTheme.textTheme.titleMedium,
                              ),
                              Text(
                                vehicle.price,
                                style: HoubagoTheme.textTheme.titleMedium?.copyWith(
                                  color: HoubagoTheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            vehicle.description,
                            style: HoubagoTheme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: vehicles.length,
            viewportFraction: 0.8,
            scale: 0.9,
            duration: 300,
            physics: const BouncingScrollPhysics(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              final driver = drivers[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(driver.photoUrl),
                  ),
                  title: Text(
                    '${driver.firstName} ${driver.lastName}',
                    style: HoubagoTheme.textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driver.phoneNumber,
                        style: HoubagoTheme.textTheme.bodyMedium,
                      ),
                      Text(
                        'Inscrit le ${DateFormat('dd/MM/yyyy').format(driver.registrationDate)}',
                        style: HoubagoTheme.textTheme.bodySmall?.copyWith(
                          color: HoubagoTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
